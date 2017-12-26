class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?
  protected
  def after_sign_in_path_for(resource)
    home_path
  end

  def after_sign_out_path_for(resource)
    sign_in_path
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name,:last_name,:username])
    devise_parameter_sanitizer.permit(:account_update, keys: [:user_name, :first_name, :last_name, :email, :password, :remember_me,:current_password])  
    devise_parameter_sanitizer.permit(:sign_in) do |user_params|
      user_params.permit(:username,:remember_me, :email)
    end
  end
end
