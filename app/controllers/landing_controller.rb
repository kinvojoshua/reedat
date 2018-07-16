class LandingController < ApplicationController

  def index
    @user = User.find(session[:current_user_id])
    @posts = Post.all()
  end

end
