class ApplicationController < ActionController::Base
  before_action :authenticate_user!
   protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:account_update, keys: [:email, :password, :password_confirmation, :current_password])
  end


  def styles
    render 'styles.css', layout: false, content_type: 'text/css'
  end
end

