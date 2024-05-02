#app/controllers/users_controller.rb
class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:dashboard, :show]

  def dashboard
    @user = current_user
    # Add any other setup you need for the dashboard
  end

  def show
    @user = User.find_by(id: params[:id])
    unless @user
      flash[:alert] = "User not found"
      redirect_to root_path
    end
  end
end