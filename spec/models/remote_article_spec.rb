require "rails_helper"
require "shared_rutines"

RSpec.describe RemoteArticle, type: :model do
  context "with URI" do
    it "generates a valid NewsAPI query URL" do
      k = Rails.application.credentials.newsapi[:api_key]
      got = described_class.build_query(q_in_title: "q", sort_by: "s")
      expected = URI.parse("https://newsapi.org/v2/everything?apiKey=#{k}&qInTitle=q&sortBy=s&pageSize=10&page=1")
      expect(got).to eq(expected)
    end
  end

  context "with paggeable counter" do
    it "keeps track of the last requested article" do
      total_times = rand(10)
      total_times.times do
        described_class.next_element_id
      end
      expect(described_class.current_element_id).to eq(total_times)
    end
  end
end
