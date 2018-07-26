class PostsController < ApplicationController
  def create
    @post = Post.create(permitted_params)
    redirect_to welcome_path if @post.save
  end

  def show
    @post = Post.find(params[:id])
    @comments = @post.comments.where(comment_id: nil)
  end

  def destroy
    @post = Post.find(params[:id]).destroy
    redirect_to welcome_path
  end

  private

  def permitted_params
    params.permit(:title, :body, :user_id, :photos)
  end
end
