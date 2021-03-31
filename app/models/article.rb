class Article < ApplicationRecord
  # A set of constants in the model to avoid hard-coding them
  TITLE_MAX = 60
  TITLE_MIN = 5
  CONTENT_MIN = 75
  IMG_ALT_MIN = 10
end
