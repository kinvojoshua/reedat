class PostsController < ApplicationController

  def create
    @post = Post.create(permitted_params)

    if @post.save
      redirect_to welcome_path
    end
  end

  def show
    @post = Post.find(params[:id])
    @comments = @post.comments.where(comment_id: nil)
  end

  private
  def permitted_params
    params.permit(:title, :body, :user_id, :photos)
  end
end
