class RemoteArticle
  include ActiveModel::Validations
  include ActiveModel::Conversion
  extend ActiveModel::Naming
  extend Pageable

  PAGGER = Kaminari.config.default_per_page

  attr_accessor :author, :title, :content, :image_caption, :image_url, :article_url, :created_at

  validates :author, presence: true
  validates :title, presence: true
  validates :content, presence: true
  validates :image_caption, presence: true
  validates :image_url, presence: true
  validates :article_url, presence: true
  validates :created_at, presence: true

  def initialize(uri, params = {})
    (Rails.cache.delete(uri); return) if params.nil?

    @author = params["author"] || params["source"]["name"]
    @title = params["title"]
    @content = params["content"]
    @image_caption = params["description"]
    @image_url = params["urlToImage"]
    @article_url = params["url"]
    @created_at = Time.zone.parse(params["publishedAt"])
  end

  def persisted?() = false

  # Build is a factory that will build the n-th element where 'n' comes from Pageable
  def self.build(keyword)
    uri = build_query(q_in_title: keyword, page: page_id).to_s
    article = -> { new(uri, (cached_remote_response(uri))["articles"][element_offset_id]) }
    puts "{ page: #{page_id} ; current_element_id: #{current_element_id} ; element_offset_id : #{element_offset_id} }"
    article.call
  end

  def self.cached_remote_response(uri)
    Rails.cache.fetch(uri, expires_in: 3.hours) do
      JSON.parse(RestClient.get(uri))
    end
  end

  def self.total_articles(keyword)
    uri = build_query(q_in_title: keyword, page: page_id).to_s
    cached_remote_response(uri)["totalResults"]
  end

  def self.build_query(arg = {})
    api_key = Rails.application.credentials.newsapi[:api_key]
    keyword = arg[:q_in_title]
    order = arg[:sort_by] || "publishedAt"
    pagger = arg[:page_size] || self::PAGGER
    page = arg[:page] || 1
    query = "apiKey=#{api_key}&qInTitle=#{keyword}&sortBy=#{order}&pageSize=#{pagger}&page=#{page}"
    URI::HTTPS.build(host: "newsapi.org", path: "/v2/everything", query: query)
  end
end
