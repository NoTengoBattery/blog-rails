module ApplicationHelper
  def locale_link(name, id, params = {})
    params[:method] = :patch
    link_to name, site_locale_path(id), params
  end

  def alert_class(type)
    case type
    when "alert"
      "alert alert-danger"
    when "notice"
      "alert alert-success"
    when "info"
      "alert alert-info"
    else
      "alert alert-primary"
    end
  end

  def attr_name(attr, res)
    res.class.human_attribute_name(attr)
  end

  def truncate_text(text, size)
    "#{text[0...(size - 1)]}…"
  end

  def social_link(link, icon)
    link_to(link, class: "nav-link d-flex align-items-center justify-content-around footer-social") do
      tag.span("", class: :iconify, "data-icon": "cib:#{icon}", "data-inline": false)
    end
  end
end
