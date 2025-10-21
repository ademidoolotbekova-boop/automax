# == Schema Information
#
# Table name: user_preferences
#
#  id          :integer          not null, primary key
#  preferences :json             not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  user_id     :integer          not null
#
# Indexes
#
#  index_user_preferences_on_user_id  (user_id) UNIQUE
#
# Foreign Keys
#
#  user_id  (user_id => users.id)
#
FactoryBot.define do
  factory :user_preference do
    association :user
    preferences { { 'sidebar_variant' => 'inset' } }
  end
end
