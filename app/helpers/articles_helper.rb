module ArticlesHelper
  def img_large(record = @article)
    img_scale(record: record, w: 1920, h: 1080)
  end

  def img_medium(record = @article)
    img_scale(record: record, w: 480, h: 480)
  end

  private
    def img_scale(params = {})
      params[:record].image.variant(resize_to_fill: [params[:w], params[:h], { crop: :attention }], convert: :webp)
    end
end
