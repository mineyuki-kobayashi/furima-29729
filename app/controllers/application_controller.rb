class ApplicationController < ActionController::Base
  before_action :basic_auth
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :first_name_furigana, :last_name_furigana, :birthday, :nickname])
  end

  private

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == 'furima' && password == '29729'
    end
  end
end
