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
    else
      "alert alert-primary"
    end
  end
end
