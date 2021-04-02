class ArticlesController < ApplicationController
  KEYWORD = "watches"

  before_action :authenticate_user!, except: %i[index]
  before_action :set_article, only: %i[show edit update destroy]
  before_action :authorize_user!, only: %i[edit update destroy]

  def index
    @articles = Article.eager_image.eager_author.newest.page(session_page(:local, params[:local]))
    @remote_articles = RemoteArticle.page(session_page(:remote, params[:remote]), ArticlesController::KEYWORD)
  end

  def new
    @article = Article.new
  end

  def create
    @article = current_user.articles.build(article_params)

    if @article.save
      redirect_to @article, notice: I18n.t("success.messages.created", model: Article.model_name.human)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit; end

  def update
    if @article.update(article_params)
      redirect_to @article, notice: "Article was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @article.destroy
    redirect_to articles_url, notice: "Article was successfully destroyed."
  end

  private
    def session_page(which, new)
      page = "page_#{which}".to_sym
      new_page = new&.to_i
      session[page] = new_page&.positive? ? new : (session[page] || 1)
    end

    def authorize_user!
      return if @article.author == current_user

      redirect_back fallback_location: root_path, alert: I18n.t("errors.messages.unauthorized")
    end

    def set_article
      @article = Article.find(params.require(:id))
    end

    def article_params
      params.require(:article).permit(:title, :content, :image_caption, :image)
    end
end
