class VotesController < ApplicationController
  def create
    @vote = Vote.new
    @vote.user = current_user
    @post = Post.find(params[:post].to_i)
    @vote.post = @post
    @vote.upvote = params[:vote]
    if @post.votes.present? && @post.votes.where(user_id: current_user.id).present?
      check
      redirect_to welcome_path
    else
      redirect_to welcome_path if @vote.save
    end
  end

  def check
    @check = Vote.where(post: params[:post].to_i).where(user_id: current_user.id)
    @bool = to_boolean(params[:vote])
    if @check.first.upvote == @bool
      @check.first.update_attribute(:upvote, nil)
    else
      @check.first.update_attribute(:upvote, @bool)
    end
  end

  def to_boolean(vote)
    return true   if vote == true   || vote =~ (/(true|t|yes|y|1)$/i)
    return false  if vote == false  || vote.blank? || vote =~ (/(false|f|no|n|0)$/i)
  end
end
