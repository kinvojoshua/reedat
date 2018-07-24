class LandingController < ApplicationController
  def index
    @posts = Post.all
  end

  def login
  end

  def authenticate
    @user = User.find_for_authentication(username: params[:username])
    @user.valid_password?(params[:password]) ? @user: nil
    if @user.present?
      sign_in(@user)
      redirect_to root_path
    else
      redirect_to login_path
    end
  end

  def logout

  end
end
