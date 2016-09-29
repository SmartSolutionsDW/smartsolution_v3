class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  before_action :configure_permitted_parameters, if: :devise_controller?
  protect_from_forgery with: :exception
  
  #sintaxis para renderizar pagina a usuario logueado
  def after_sign_in_path_for(resource)
    request.env['omniauth.origin'] || stored_location_for(resource) || home_index_path
  end
  #
  
  
  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :encrypted_password, :reset_password_token, :current_sign_in_at, :last_sign_in_at, :current_sign_in_ip, :last_sign_in_ip, :created_at, :updated_at, :admin, :nombre, :apellido, :dni, :uid, :provider])
    devise_parameter_sanitizer.permit(:account_update, keys: [:email, :encrypted_password, :reset_password_token, :current_sign_in_at, :last_sign_in_at, :current_sign_in_ip, :last_sign_in_ip, :created_at, :updated_at, :admin, :nombre, :apellido, :dni, :uid, :provider])
   
  end

  
end
