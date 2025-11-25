class Conversation < ApplicationRecord
  # Associations
  belongs_to :user
  has_many :messages, -> { order(created_at: :asc) }, dependent: :destroy

  # Validations
  validates :country, presence: true, inclusion: { in: %w[kg ru us] }

  # Scopes
  scope :recent, -> { order(last_message_at: :desc) }
  scope :for_country, ->(country) { where(country: country) }

  # Callbacks
  before_create :set_started_at

  # Instance methods
  def add_message(role:, content:, image_url: nil)
    messages.create!(
      role: role,
      content: content,
      image_url: image_url
    )
    touch(:last_message_at)
  end

  def user_messages
    messages.where(role: 'user')
  end

  def assistant_messages
    messages.where(role: 'assistant')
  end

  private

  def set_started_at
    self.started_at ||= Time.current
    self.last_message_at ||= Time.current
  end
end
