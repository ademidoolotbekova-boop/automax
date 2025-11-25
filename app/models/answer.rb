class Answer < ApplicationRecord
  # Associations
  belongs_to :question
  has_many :user_answers, dependent: :destroy

  # Validations
  validates :answer_text, presence: true
  validates :position, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :is_correct, inclusion: { in: [true, false] }

  # Scopes
  scope :correct, -> { where(is_correct: true) }
  scope :incorrect, -> { where(is_correct: false) }
  scope :ordered, -> { order(position: :asc) }
end
