class ApplicationController < ActionController::Base

  respond_to :html, :json

  before_action :configure_permitted_parameters, if: :devise_controller?
  protect_from_forgery with: :exception

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :city, contract_attributes: [:contract_type, :vehicle]])
  end
end
