class VotesController < ApplicationController
  def create
    @vote = Vote.new
    @vote.user = current_user
    @post = Post.find(params[:format].to_i)
    @vote.post = @post
    @vote.upvote = true
    if @post.votes.present? && @post.votes.where(user_id: current_user.id).present?
      redirect_to welcome_path
    else
      redirect_to welcome_path if @vote.save
    end
  end
end
