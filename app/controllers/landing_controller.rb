require 'identicon'
class LandingController < ApplicationController
  def index
    @posts = Post.all
    if user_signed_in?
      @identicon = Identicon.data_url_for current_user.username, 35
    end
  end

  def login
  end

  def authenticate
    @user = User.find_for_authentication(username: params[:username])
    if @user.present?
      sign(@user)
    else
      redirect_to login_path
    end
  end

  def sign(user)
    if user.valid_password?(params[:password])
      sign_in(user)
      redirect_to root_path
    else
      redirect_to login_path
    end
  end
end
