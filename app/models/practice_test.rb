class PracticeTest < ApplicationRecord
  # Associations
  has_many :questions, -> { order(position: :asc) }, dependent: :destroy
  has_many :test_attempts, dependent: :destroy

  # Validations
  validates :title, presence: true, length: { maximum: 200 }
  validates :test_type, presence: true, inclusion: { in: %w[quick_quiz traffic_signs full_exam advanced_scenarios] }
  validates :duration_minutes, presence: true, numericality: { only_integer: true, greater_than: 0 }
  validates :questions_count, presence: true, numericality: { only_integer: true, greater_than: 0 }
  validates :passing_score, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 100 }
  validates :position, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  # Scopes
  scope :ordered, -> { order(position: :asc) }
  scope :by_type, ->(type) { where(test_type: type) }

  # Instance methods
  def duration_display
    "#{duration_minutes} minutes"
  end
end
