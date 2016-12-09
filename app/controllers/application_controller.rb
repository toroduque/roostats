class ApplicationController < ActionController::Base

  respond_to :html, :json

  before_action :configure_permitted_parameters, if: :devise_controller?
  before_filter :store_current_location, :unless => :devise_controller?
  protect_from_forgery with: :exception

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :city, contract_attributes: [:contract_type, :vehicle]])
  end

  private
  def store_current_location
    store_location_for(:rider, riders_path)
  end
end
