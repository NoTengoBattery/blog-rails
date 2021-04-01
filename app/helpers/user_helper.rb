module UserHelper
  def sign_up_or_profile(params = {})
    if signed_in?
      link_to current_user.display, current_user, params
    else
      link_to I18n.t("devise.shared.links.sign_up"), new_user_registration_path, params
    end
  end

  def sign_in_or_out(params = {})
    if signed_in?
      params[:method] = :delete
      link_to I18n.t("devise.shared.links.sign_out"), destroy_user_session_path, params
    else
      link_to I18n.t("devise.shared.links.sign_in"), user_session_path, params
    end
  end

  def attr_name(attr, res = @user)
    res.class.human_attribute_name(attr)
  end
end
