class User < ApplicationRecord
  DISPLAY_MIN = 6
  DISPLAY_MAX = 15

  devise :database_authenticatable, :registerable, :rememberable, :trackable, :validatable

  validates :display, presence: true
  validates :display, length: { minimum: User::DISPLAY_MIN, maximum: User::DISPLAY_MAX }
  validates :display, uniqueness: true

  has_many :articles, dependent: :destroy, inverse_of: :author
end
