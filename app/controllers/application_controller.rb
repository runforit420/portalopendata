class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  def styles
    render 'styles.css', layout: false, content_type: 'text/css'
  end
end

