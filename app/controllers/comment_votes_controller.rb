class CommentVotesController < ApplicationController
  def create
    @comment_vote = CommentVote.new(comment_vote_params)
    @comment = Comment.find(params[:comment_id])
    @comment_vote.comment = @comment

    @comment_vote.user = current_user
    @comment_vote.save

    redirect_to comment_path(@comment)
  end

  private

  def comment_vote_params
    params.require(:comment_vote).permit(:value)
  end
end
