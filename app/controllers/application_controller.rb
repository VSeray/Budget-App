class ApplicationController < ActionController::Base
  protect_from_forgery with :exception
  before_action :condigure_permitted_parameters, if: :devise_controller?

  private

  def condigure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:name, :email, :password) }
    devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:name, :email, :password, :current_password) }
  end
end
