class LandingController < ApplicationController
  def index
    @posts = Post.all
  end

  def login
  end

  def authenticate
    @user = User.find_for_authentication(username: params[:username])
    @user.valid_password?(params[:password]) ? @user: nil
    unless @user.nil?
      sign_in(@user)
      redirect_to root_path
    end
  end
end
