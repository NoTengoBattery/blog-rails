module ArticlesHelper
  def img_large(record)
    img_scale(record: record, w: 1920, h: 1080)
  end

  def img_medium(record)
    img_scale(record: record, w: 735, h: 415)
  end

  def img_small(record)
    img_scale(record: record, w: 480, h: 270)
  end

  private
    def img_scale(params = {})
      params[:record].image.variant(resize_to_fill: [params[:w], params[:h], { crop: :attention }], convert: :webp)
    end
end
