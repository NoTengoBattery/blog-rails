class UsersController < ApplicationController
  before_action :set_user, only: %i[show]
  def show
    @articles = @user.articles.eager_image.newest.page(session_page(:page, params[:page]))
  end

  private
    def set_user
      @user = User.find(params[:id])
    end

    def session_page(which, new)
      page = "#{self.class}_#{@user.display}_#{which}".to_sym
      new_page = new&.to_i
      session[page] = new_page&.positive? ? new_page : (session[page] || 1)
    end
end
