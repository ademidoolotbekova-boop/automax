# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string           not null
#  name                   :string           not null
#  owner                  :boolean          default(FALSE), not null
#  password_digest        :string           not null
#  reset_password_digest  :string
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_users_on_email  (email) UNIQUE
#
require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    subject { build(:user) }

    it { should validate_presence_of(:email) }
    it { should validate_uniqueness_of(:email).case_insensitive }
    it { should allow_value('user@example.com').for(:email) }
    it { should_not allow_value('invalid_email').for(:email) }

    it { should validate_presence_of(:name) }
    it { should validate_length_of(:name).is_at_least(2).is_at_most(100) }

    it { should have_secure_password }
    it { should validate_length_of(:password).is_at_least(8).on(:create) }
  end

  describe 'associations' do
    it { should have_many(:refresh_tokens).dependent(:destroy) }
  end

  describe 'owner flag' do
    let(:user) { create(:user) }
    let(:owner) { create(:user, :owner) }

    describe '#owner?' do
      it 'returns true for super admins' do
        expect(owner.owner?).to be true
      end

      it 'returns false for regular users' do
        expect(user.owner?).to be false
      end
    end
  end

  describe 'password reset' do
    let(:user) { create(:user) }

    describe '#generate_password_reset_token' do
      it 'generates a reset token and digest' do
        token = user.generate_password_reset_token

        expect(token).to be_present
        expect(user.reset_password_token).to be_present
        expect(user.reset_password_digest).to be_present
        expect(user.reset_password_sent_at).to be_within(1.second).of(Time.current)
      end

      it 'returns a unique token' do
        token1 = user.generate_password_reset_token
        user2 = create(:user)
        token2 = user2.generate_password_reset_token

        expect(token1).not_to eq(token2)
      end
    end

    describe '#password_reset_expired?' do
      it 'returns false for recent tokens' do
        user.generate_password_reset_token
        expect(user.password_reset_expired?).to be false
      end

      it 'returns true for tokens older than 2 hours' do
        user.update(reset_password_sent_at: 3.hours.ago)
        expect(user.password_reset_expired?).to be true
      end

      it 'returns true when no token was sent' do
        user.update(reset_password_sent_at: nil)
        expect(user.password_reset_expired?).to be true
      end
    end

    describe '#clear_password_reset' do
      it 'clears all password reset fields' do
        user.generate_password_reset_token
        user.clear_password_reset

        expect(user.reset_password_token).to be_nil
        expect(user.reset_password_digest).to be_nil
        expect(user.reset_password_sent_at).to be_nil
      end
    end
  end

  describe 'email normalization' do
    it 'normalizes email to lowercase' do
      user = create(:user, email: 'User@Example.COM')
      expect(user.email).to eq('user@example.com')
    end
  end
end
