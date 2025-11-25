class LessonCategory < ApplicationRecord
  # Associations
  has_many :lessons, -> { order(position: :asc) }, dependent: :destroy

  # Validations
  validates :name, presence: true, length: { maximum: 100 }
  validates :slug, presence: true, uniqueness: true
  validates :position, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :icon, presence: true

  # Scopes
  scope :ordered, -> { order(position: :asc) }

  # Callbacks
  before_validation :generate_slug, if: -> { slug.blank? && name.present? }

  private

  def generate_slug
    self.slug = name.parameterize
  end
end
