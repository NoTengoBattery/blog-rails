require "rails_helper"
require "shared_rutines"

# rubocop:disable Metrics/BlockLength
RSpec.describe "/articles", type: :request do
  include ActionDispatch::TestProcess::FixtureFile

  let(:valid_attributes) do
    article = FactoryBot.build(:article)
    valid_object = {}
    valid_object[:user_id] = article.user_id
    valid_object[:title] = article.title
    valid_object[:content] = article.content
    valid_object[:image_caption] = article.image_caption
    valid_object[:image] = fixture_file_upload(file_fixture("test.jpg"), "image/jpeg")
    valid_object
  end

  let(:invalid_attributes) do
    invalid_object = {}
    invalid_object[:user_id] = 0
    invalid_object[:title] = ""
    invalid_object[:content] = ""
    invalid_object[:image_caption] = ""
    invalid_object
  end

  describe "GET /index" do
    it "renders a successful response" do
      Article.create! valid_attributes
      get articles_url
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      article = Article.create! valid_attributes
      get article_url(article)
      expect(response).to be_successful
    end
  end

  describe "GET /new" do
    it "renders a successful response" do
      get new_article_url
      expect(response).to be_successful
    end
  end

  describe "GET /edit" do
    it "render a successful response" do
      article = Article.create! valid_attributes
      get edit_article_url(article)
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new Article" do
        expect do
          post articles_url, params: { article: valid_attributes }
        end.to change(Article, :count).by(1)
      end

      it "redirects to the created article" do
        post articles_url, params: { article: valid_attributes }
        expect(response).to redirect_to(article_url(Article.last))
      end
    end

    context "with invalid parameters" do
      it "does not create a new Article" do
        expect do
          post articles_url, params: { article: invalid_attributes }
        end.to change(Article, :count).by(0)
      end

      it "renders a unprocessable entity response" do
        post articles_url, params: { article: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) do
        skip("Add a hash of attributes valid for your model")
      end

      it "updates the requested article" do
        article = Article.create! valid_attributes
        patch article_url(article), params: { article: new_attributes }
        article.reload
        skip("Add assertions for updated state")
      end

      it "redirects to the article" do
        article = Article.create! valid_attributes
        patch article_url(article), params: { article: new_attributes }
        article.reload
        expect(response).to redirect_to(article_url(article))
      end
    end

    context "with invalid parameters" do
      it "renders a unprocessable entity response" do
        article = Article.create! valid_attributes
        patch article_url(article), params: { article: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested article" do
      article = Article.create! valid_attributes
      expect do
        delete article_url(article)
      end.to change(Article, :count).by(-1)
    end

    it "redirects to the articles list" do
      article = Article.create! valid_attributes
      delete article_url(article)
      expect(response).to redirect_to(articles_url)
    end
  end
end
# rubocop:enable Metrics/BlockLength
