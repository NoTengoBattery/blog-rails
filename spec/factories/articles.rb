require_relative "faker_constraint"

FactoryBot.define do
  factory :article do
    title { sentence_with_length(w_cnt: 10, w_add: 15, min_l: Article::TITLE_MIN, max_l: Article::TITLE_MAX) }
    content { paragraphs_with_length(s_cnt: 15, s_add: 45, min_l: Article::CONTENT_MIN) }
    image_caption { sentence_with_length(w_cnt: 5, w_add: 10, min_l: Article::IMG_ALT_MIN) }
    image { Rack::Test::UploadedFile.new("spec/fixtures/files/test_lq.jpg", "image/jpeg") }

    before(:create) do |article|
      article.author = FactoryBot.create(:user)
    end
  end
end
