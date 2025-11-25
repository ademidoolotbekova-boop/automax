class Message < ApplicationRecord
  # Associations
  belongs_to :conversation

  # Validations
  validates :role, presence: true, inclusion: { in: %w[user assistant system] }
  validates :content, presence: true

  # Scopes
  scope :ordered, -> { order(created_at: :asc) }
  scope :by_role, ->(role) { where(role: role) }

  # Instance methods
  def user_message?
    role == 'user'
  end

  def assistant_message?
    role == 'assistant'
  end

  def has_image?
    image_url.present?
  end
end
