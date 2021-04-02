class ArticlesController < ApplicationController
  KEYWORD = "watches".freeze

  before_action :authenticate_user!, except: %i[index]
  before_action :set_article, only: %i[show edit update destroy]
  before_action :authorize_user!, only: %i[edit update destroy]

  def index
    articles = Article.eager_image.eager_author.newest
    @articles = articles.page(session_page(:local, params[:local]))
    @remote_articles = remote_articles
  end

  def show; end

  def new
    @article = Article.new
  end

  def create
    @article = current_user.articles.build(article_params)

    if @article.save
      redirect_to @article, notice: I18n.t("success.messages.created", model: Article.model_name.human).humanize
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit; end

  def update
    if @article.update(article_params)
      redirect_to @article, notice: I18n.t("success.messages.updated", model: Article.model_name.human).humanize
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @article.destroy
    redirect_to articles_url, notice: I18n.t("success.messages.destroyed", model: Article.model_name.human).humanize
  end

  private
    # Some poeple think: you should not put logic in the controller!
    # Well, yes but to be fair, you also don't want to handle the session in the models/views, so...
    # `session_page` is handling the session, it's fine
    # `remote_articles_get` is calling the model and Kaminari, but these calls are long so I broke them up
    # `remote_articles` is just simply gracefully handling errors to show a nice flash, so it's fine
    def session_page(which, new)
      page = "page_#{which}".to_sym
      new_page = new&.to_i
      session[page] = new_page&.positive? ? new_page : (session[page] || 1)
    end

    def remote_articles_get
      remote_sel_page = session_page(:remote, params[:remote])
      remote_page = RemoteArticle.page(remote_sel_page, ArticlesController::KEYWORD)
      remote_count = RemoteArticle.total_articles(ArticlesController::KEYWORD)
      Kaminari.paginate_array(remote_page, total_count: remote_count).page(remote_sel_page)
    end

    def remote_articles
      remote_articles_get
    rescue RestClient::UpgradeRequired
      flash.now[:info] = I18n.t("misc.paywall")
      params[:remote] = "1"
      retry
    rescue RestClient::TooManyRequests
      flash.now[:info] = I18n.t("misc.rate_limit")
      Kaminari.paginate_array([]).page(0)
    end

    def authorize_user!
      return if @article.author == current_user

      redirect_back fallback_location: root_path, alert: I18n.t("errors.messages.unauthorized").humanize
    end

    def set_article
      @article = Article.find(params.require(:id))
    end

    def article_params
      params.require(:article).permit(:title, :content, :image_caption, :image)
    end
end
