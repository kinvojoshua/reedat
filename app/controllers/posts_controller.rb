class PostsController < ApplicationController
  @query = nil
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

  def search
    @posts = Post.where('title LIKE ?', "#{params[:title]}")
  end

  private

  def permitted_params
    params.permit(:title, :body, :user_id, :photos)
  end
end
