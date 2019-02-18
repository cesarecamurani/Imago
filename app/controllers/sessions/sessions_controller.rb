# frozen_string_literal: true

class Sessions::SessionsController < Devise::SessionsController
  before_action :configure_sign_in_params, only: [:new, :create, :destroy]

  def new
    super
  end

  def create
    super
  end

  def destroy
    User.find(session[:user_id]).destroy
    session[:user_id] = nil
    redirect_back(fallback_location: root_path)
  end


  protected


  def configure_sign_in_params
    devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  end

end
