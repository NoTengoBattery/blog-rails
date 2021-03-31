class User < ApplicationRecord
  DISPLAY_MIN = 6
  DISPLAY_MAX = 15

  devise :database_authenticatable, :registerable, :rememberable, :trackable, :validatable
end
