class AdminController < ApplicationController
  before_action :authenticate_user
  def index
    @user = User.all
  end

  private
  
  def authenticate_user
    @user = User.find(session[:current_user_id])
    unless @user.role == 'admin'
      flash[:error] == 'For admin only'
      redirect_to welcome_path
    end
  end
end

