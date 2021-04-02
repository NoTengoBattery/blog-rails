module UserHelper
  def sign_up_or_profile(params = {})
    params[:method] = :get
    if signed_in?
      button_to current_user.display, user_path(current_user), params # TODO
    else
      button_to I18n.t("devise.shared.links.sign_up"), new_user_registration_path, params
    end
  end

  def sign_in_or_out(params = {})
    params[:method] = :get
    if signed_in?
      params[:method] = :delete
      button_to I18n.t("actions.sign_out"), destroy_user_session_path, params
    else
      button_to I18n.t("devise.shared.links.sign_in"), user_session_path, params
    end
  end

  def authorized?(user)
    user == current_user
  end
end
