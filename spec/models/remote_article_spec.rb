require "rails_helper"
require "shared_rutines"

RSpec.describe RemoteArticle, type: :model do
  context "with validations" do
    subject { described_class.build("test") }

    it { is_expected.to validate_presence_of(:author) }
    it { is_expected.to validate_presence_of(:title) }
    it { is_expected.to validate_presence_of(:content) }
    it { is_expected.to validate_presence_of(:image_caption) }
    it { is_expected.to validate_presence_of(:image_url) }
    it { is_expected.to validate_presence_of(:article_url) }
  end

  context "with URI" do
    it "generates a valid NewsAPI query URL" do
      k = Rails.application.credentials.newsapi[:api_key]
      p = described_class::PAGGER
      got = described_class.build_query(q_in_title: "q", sort_by: "s")
      expected = URI.parse("https://newsapi.org/v2/everything?apiKey=#{k}&qInTitle=q&sortBy=s&pageSize=#{p}&page=1")
      expect(got).to eq(expected)
    end
  end

  context "with paggeable counter" do
    before do
      described_class.element_id = 0
    end

    it "keeps track of the last requested article" do
      total_times = rand(10)
      total_times.times do
        described_class.next_element_id
      end
      expect(described_class.current_element_id).to eq(total_times)
    end

    it "calculates the page correctly" do
      id = 30
      page = ((id + 1) / described_class::PAGGER.to_f).ceil
      described_class.element_id = id
      expect(described_class.page_id).to eq(page)
    end

    it "calculates the page offset correctly" do
      id = 39
      offset = id % described_class::PAGGER
      described_class.element_id = id
      expect(described_class.element_offset_id).to eq(offset)
    end
  end

  context "with remote content" do
    it "generates a valid model from the API response" do
      expect(described_class.build("test")).to be_valid
    end
  end
end
