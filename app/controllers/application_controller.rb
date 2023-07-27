class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:Name, :Bio, :Photo, :email, :password, :password_confirmation) }
    devise_parameter_sanitizer.permit(:account_update, keys: %i[Name email Bio Photo password current_password])
  end
end
