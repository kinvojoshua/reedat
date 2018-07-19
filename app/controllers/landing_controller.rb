class LandingController < ApplicationController

  def index
    if session[:current_user_id] != nil
      @user = User.find(session[:current_user_id])
      @posts = Post.all()
    else
      @posts = Post.all()
    end
  end

  def login
    if session[:current_user_id] != nil
      redirect_to root_path
    end
  end

  def authenticate
    @user = User.find_by_username(params[:username])

    if @user && @user.authenticate(params[:password])
      session[:current_user_id] = @user.id
      redirect_to root_path
    else
      redirect_to login_path, :flash => { :error => "user not found." }
    end
  end

  def logout
    reset_session
    redirect_to welcome_path
  end

end
