class RemoteArticle
  include ActiveModel::Validations
  include ActiveModel::Conversion
  extend ActiveModel::Naming
  extend Pageable

  PAGGER = 10

  def persisted?() = false

  def self.build_query(arg = {})
    api_key = Rails.application.credentials.newsapi[:api_key]
    keyword = arg[:q_in_title]
    order = arg[:sort_by] || "relevancy"
    pagger = arg[:page_size] || RemoteArticle::PAGGER
    page = arg[:page] || 1
    query = "apiKey=#{api_key}&qInTitle=#{keyword}&sortBy=#{order}&pageSize=#{pagger}&page=#{page}"
    URI::HTTPS.build(host: "newsapi.org", path: "/v2/everything", query: query)
  end
end
