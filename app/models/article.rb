class Article < ApplicationRecord
  # A set of constants in the model to avoid hard-coding them in the seeds and tests
  CONTENT_MIN = 75
  IMG_ALT_MIN = 10
  TITLE_MAX = 60
  TITLE_MIN = 5

  validates :title, presence: true
  validates :title, uniqueness: { scope: :user_id }
  validates :title, length: { minimum: Article::TITLE_MIN, maximum: Article::TITLE_MAX }
  validate :acceptable_image
  validates :image_caption, presence: true
  validates :image_caption, length: { minimum: Article::IMG_ALT_MIN }
  validates :content, presence: true
  validates :content, length: { minimum: Article::CONTENT_MIN }

  belongs_to :author, class_name: :User, foreign_key: :user_id, inverse_of: :articles
  has_one_attached :image

  # rubocop:disable Metrics/AbcSize
  def acceptable_image
    types = ["image/jpeg", "image/png", "image/tiff"]
    mbytes = 5.megabyte
    (errors.add(:image, I18n.t("errors.messages.blank")); return) unless image.attached?
    errors.add(:image, I18n.t("errors.messages.oversize", size: "#{mbytes} byest")) unless image.byte_size <= mbytes
    return if types.include?(image.content_type)

    errors.add(:image, I18n.t("errors.messages.format", formats: types.join(",")))
  end
  # rubocop:enable Metrics/AbcSize
end
