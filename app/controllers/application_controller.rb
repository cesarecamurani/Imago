class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  protect_from_forgery with: :exception

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :name, :password, :password_confirmations])
  end

  def after_sign_in_path_for(_resource)
    user_path(current_user.id)
  end

  def after_sign_out_path_for(_resource)
    new_user_session_path
  end

end
