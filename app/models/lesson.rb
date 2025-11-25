class Lesson < ApplicationRecord
  # Associations
  belongs_to :lesson_category
  has_many :user_lesson_progresses, dependent: :destroy

  # Validations
  validates :title, presence: true, length: { maximum: 200 }
  validates :slug, presence: true, uniqueness: true
  validates :duration_minutes, presence: true, numericality: { only_integer: true, greater_than: 0 }
  validates :position, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  # Scopes
  scope :ordered, -> { order(position: :asc) }

  # Callbacks
  before_validation :generate_slug, if: -> { slug.blank? && title.present? }

  # Instance methods
  def progress_for(user)
    user_lesson_progresses.find_by(user: user)
  end

  def completed_by?(user)
    progress_for(user)&.completed? || false
  end

  def duration_display
    "#{duration_minutes} min"
  end

  private

  def generate_slug
    base_slug = title.parameterize
    self.slug = base_slug
    counter = 1
    while Lesson.where(slug: slug).where.not(id: id).exists?
      self.slug = "#{base_slug}-#{counter}"
      counter += 1
    end
  end
end
