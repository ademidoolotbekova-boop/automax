class UserAnswer < ApplicationRecord
  # Associations
  belongs_to :test_attempt
  belongs_to :question
  belongs_to :answer

  # Validations
  validates :test_attempt_id, uniqueness: { scope: :question_id }

  # Callbacks
  before_save :set_correctness

  private

  def set_correctness
    self.is_correct = answer.is_correct
  end
end
