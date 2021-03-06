class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  #antes de qualquer ação, filtrar controlador do controle de usuarios para definir os parametros
  #permitidos a edição (SQL INJECTION PREVENTION SYSTEM --> SANITIZE)
  before_action :configure_permitted_parameters, if: :devise_controller?

  #permite que o controladore de usuario faça login independente de em que página esteja
  def after_update_path_for(resource)
    request.referer
  end

  def after_sign_in_path_for(resource)
    user_path(current_user)
  end

  def after_sign_out_path_for(resource)
    root_path
  end

  #devise login from anywhere

  def resource_name
    :user
  end

  def resource
    @resource ||= User.new
  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end

  def configure_permitted_parameters
    registration_params = [:name, :email, :password, :password_confirmation, :current_password]

    devise_parameter_sanitizer.for(:sign_up) << registration_params
    devise_parameter_sanitizer.for(:sign_in) << registration_params
  end
end
