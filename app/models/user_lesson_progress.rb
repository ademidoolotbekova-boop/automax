class UserLessonProgress < ApplicationRecord
  # Associations
  belongs_to :user
  belongs_to :lesson

  # Validations
  validates :user_id, uniqueness: { scope: :lesson_id }

  # Scopes
  scope :completed, -> { where(completed: true) }
  scope :in_progress, -> { where(completed: false).where.not(started_at: nil) }

  # Instance methods
  def mark_as_started
    return if started_at.present?

    update!(started_at: Time.current)
  end

  def mark_as_completed
    update!(
      completed: true,
      completed_at: Time.current
    )
  end

  def add_time_spent(minutes)
    increment!(:time_spent_minutes, minutes)
  end

  def in_progress?
    started_at.present? && !completed?
  end
end
