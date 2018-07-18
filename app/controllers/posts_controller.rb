class PostsController < ApplicationController

  def new
    @post = Post.new
  end

  def create
    @post = Post.create(permitted_params)
    if @post.save
      redirect_to welcome_path
    else
      byebug
    end
  end

  private
  def permitted_params
    params.permit(:title, :body, :user_id)
  end
end
