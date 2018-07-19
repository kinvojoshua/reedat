class LandingController < ApplicationController

  def index
    if session[:current_user_id] != nil
      @user = User.find(session[:current_user_id])
      @posts = Post.all()
    else
      @posts = Post.all()
    end

  end

end
