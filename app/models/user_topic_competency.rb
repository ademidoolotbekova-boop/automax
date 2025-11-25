class UserTopicCompetency < ApplicationRecord
  # Associations
  belongs_to :user
  belongs_to :lesson_category

  # Validations
  validates :user_id, uniqueness: { scope: :lesson_category_id }
  validates :correct_answers, numericality: { only_integer: true, greater_than_or_equal_to: 0 }, allow_nil: true
  validates :total_attempts, numericality: { only_integer: true, greater_than_or_equal_to: 0 }, allow_nil: true
  validates :competency_score, numericality: { greater_than_or_equal_to: 0.0, less_than_or_equal_to: 100.0 }, allow_nil: true

  # Callbacks
  before_save :calculate_competency_score

  # Scopes
  scope :strong, -> { where('competency_score >= ?', 70) }
  scope :weak, -> { where('competency_score < ?', 50) }
  scope :ordered_by_score, -> { order(competency_score: :desc) }

  # Instance methods
  def update_from_test_attempt(correct, total)
    self.correct_answers ||= 0
    self.total_attempts ||= 0

    self.correct_answers += correct
    self.total_attempts += total
    self.last_practiced_at = Time.current

    save!
  end

  def accuracy_percentage
    return 0 if total_attempts.to_i.zero?

    (correct_answers.to_f / total_attempts * 100).round(1)
  end

  def strength_level
    return 'beginner' if competency_score.nil? || competency_score < 30
    return 'weak' if competency_score < 50
    return 'moderate' if competency_score < 70
    return 'strong' if competency_score < 85
    'expert'
  end

  private

  def calculate_competency_score
    return if total_attempts.to_i.zero?

    # Competency = accuracy * recency_factor
    accuracy = accuracy_percentage
    recency_factor = calculate_recency_factor

    self.competency_score = (accuracy * recency_factor).round(1)
  end

  def calculate_recency_factor
    return 1.0 if last_practiced_at.nil?

    days_since = (Time.current - last_practiced_at) / 1.day

    # Decay factor: 1.0 if practiced today, decreases over time
    if days_since <= 1
      1.0
    elsif days_since <= 7
      0.95
    elsif days_since <= 30
      0.85
    elsif days_since <= 90
      0.70
    else
      0.50
    end
  end
end
