module ArticlesHelper
  def img_large(record)
    img_scale(record: record, w: 1100, h: 620)
  end

  def img_medium(record)
    img_scale(record: record, w: 660, h: 370)
  end

  def img_small(record)
    img_scale(record: record, w: 480, h: 270)
  end

  def article_image(record, params = {})
    if record.instance_of?(Article)
      image_tag(img_medium(record), params)
    elsif record.instance_of?(RemoteArticle)
      image_tag(record.image_url, params)
    end
  end

  def article_link(record, params = {})
    if record.instance_of?(Article)
      link_to(record.title, article_path(record), params)
    elsif record.instance_of?(RemoteArticle)
      link_to(record.title, record.article_url, params)
    end
  end

  def article_author(record, params = {})
    if record.instance_of?(Article)
      link_to(record.author.display, user_path(record.author), params)
    elsif record.instance_of?(RemoteArticle)
      content_tag(:span, record.author, params) # rubocop:disable Rails/ContentTag
    end
  end

  private
    def img_scale(params = {})
      params[:record].image.variant(resize_to_fill: [params[:w], params[:h], { crop: :attention }], convert: :webp)
    end
end
