class ApplicationController < ActionController::Base
  include Localizable

  before_action :configure_locale
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:display])
    end
end
