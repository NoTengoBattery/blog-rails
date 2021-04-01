class Article < ApplicationRecord
  # A set of constants in the model to avoid hard-coding them in the seeds and tests
  CONTENT_MIN = 75
  IMG_ALT_MIN = 10
  TITLE_MAX = 60
  TITLE_MIN = 5

  validates :user_id, presence: true
  validates :title, presence: true
  validates :title, uniqueness: { scope: :user_id }
  validates :content, presence: true
  validates :image_caption, presence: true
  validates :title, length: { minimum: Article::TITLE_MIN, maximum: Article::TITLE_MAX }
  validates :content, length: { minimum: Article::CONTENT_MIN }
  validates :image_caption, length: { minimum: Article::IMG_ALT_MIN }
  validate :acceptable_image

  belongs_to :author, class_name: :User, foreign_key: :user_id, inverse_of: :articles
  has_one_attached :image

  def acceptable_image
    unless image.attached?
      errors.add(:image, I18n.t("errors.messages.blank"))
      return
    end

    errors.add(:image, I18n.t("errors.messages.oversize", size: "5 MB")) unless image.byte_size <= 5.megabyte

    acceptable_types = ["image/jpeg", "image/png", "image/tiff"]
    unless acceptable_types.include?(image.content_type)
      errors.add(:image, I18n.t("errors.messages.format", formats: "JPG, PNG, TIFF"))
    end
  end
end
