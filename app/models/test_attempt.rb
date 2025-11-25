class TestAttempt < ApplicationRecord
  # Associations
  belongs_to :user
  belongs_to :practice_test
  has_many :user_answers, dependent: :destroy

  # Validations
  validates :started_at, presence: true

  # Scopes
  scope :completed, -> { where.not(completed_at: nil) }
  scope :in_progress, -> { where(completed_at: nil) }
  scope :recent, -> { order(created_at: :desc) }

  # Instance methods
  def complete!
    return if completed?

    calculate_score
    update!(completed_at: Time.current)
  end

  def completed?
    completed_at.present?
  end

  def in_progress?
    !completed?
  end

  def duration_seconds
    return nil unless completed?

    (completed_at - started_at).to_i
  end

  def percentage_score
    return 0 if total_questions.zero?

    (score.to_f / total_questions * 100).round
  end

  def passed?
    return false unless completed?

    percentage_score >= practice_test.passing_score
  end

  private

  def calculate_score
    self.total_questions = practice_test.questions_count
    self.correct_answers = user_answers.where(is_correct: true).count
    self.score = correct_answers
    self.passed = (percentage_score >= practice_test.passing_score)
  end
end
