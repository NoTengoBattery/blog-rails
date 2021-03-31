require "rails_helper"
require "shared_rutines"

RSpec.describe Article, type: :model do
  context "with validations" do
    subject { FactoryBot.build(:article) }

    it { is_expected.to validate_presence_of(:user_id) }
    it { is_expected.to validate_presence_of(:title) }
    it { is_expected.to validate_length_of(:title).is_at_least(Article::TITLE_MIN).is_at_most(Article::TITLE_MAX) }
    it { is_expected.to validate_presence_of(:content) }
    it { is_expected.to validate_length_of(:content).is_at_least(Article::CONTENT_MIN) }
    it { is_expected.to validate_presence_of(:image_caption) }
    it { is_expected.to validate_length_of(:image_caption).is_at_least(Article::IMG_ALT_MIN) }
    it { is_expected.to validate_uniqueness_of(:title).scoped_to(:user_id) }
  end

  context "with associations" do
    subject { FactoryBot.build(:article) }

    it { is_expected.to belong_to(:user) }
  end
end
