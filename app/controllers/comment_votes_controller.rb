class CommentVotesController < ApplicationController
  def create
    @comment_vote = CommentVote.new(comment_vote_params)
    @comment = Comment.find(params[:comment_vote][:comment_id])
    @comment_vote.comment = @comment

    @comment_vote.user = current_user
    @comment_vote.save


    @suggestion = Suggestion.find(params[:suggestion_id])
    redirect_to suggestion_path(@suggestion)

  end

  private

  def comment_vote_params
    params.require(:comment_vote).permit(:value, :comment_id)
  end
end
