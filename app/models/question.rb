class Question < ApplicationRecord
  # Associations
  belongs_to :practice_test
  has_many :answers, -> { order(position: :asc) }, dependent: :destroy
  has_many :user_answers, dependent: :destroy

  # Validations
  validates :question_text, presence: true
  validates :question_type, presence: true, inclusion: { in: %w[multiple_choice true_false] }
  validates :position, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :country, inclusion: { in: %w[kg ru us all], allow_nil: true }

  # Scopes
  scope :ordered, -> { order(position: :asc) }
  scope :for_country, ->(country) { where('country = ? OR country = ? OR country IS NULL', country, 'all') }

  # Instance methods
  def correct_answer
    answers.find_by(is_correct: true)
  end

  def correct_answer_ids
    answers.where(is_correct: true).pluck(:id)
  end
end
