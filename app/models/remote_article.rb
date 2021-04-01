class RemoteArticle
  include ActiveModel::Validations
  include ActiveModel::Conversion
  extend ActiveModel::Naming
  extend Pageable

  PAGGER = 10

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
    response = -> { Rails.cache.fetch(uri, expires_in: 3.hours) { JSON.parse(RestClient.get(uri)) } }
    article = -> { new(uri, (response.call)["articles"][current_element_id]) }
    article.call
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
