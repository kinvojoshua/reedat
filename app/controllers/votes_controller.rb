class VotesController < ApplicationController
  def create
    @vote = Vote.new
    @user = User.find(session[:current_user_id])
    @post = Post.find(params[:format].to_i)
    @vote.user = @user
    @vote.post = @post
    @vote.upvote = true
    if !@post.votes.empty? && Vote.find_by_user_id(@user.id)
      redirect_to welcome_path
    else
      if @vote.save
        redirect_to welcome_path
      end
    end



  end
end
