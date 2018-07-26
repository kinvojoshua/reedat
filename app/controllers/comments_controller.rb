class CommentsController < ApplicationController

  def new
  end

  def create
    @comment = Comment.create(permitted_params)
    if @comment.save
      redirect_to post_path(params[:post_id])
    end
  end

  private
  def permitted_params
    params.permit(:body, :user_id, :post_id, :comment_id)
  end
end
