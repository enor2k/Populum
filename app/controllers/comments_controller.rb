class CommentsController < ApplicationController
  def create
    @comment = Comment.new(comment_params)
    # we need `suggestion_id` to associate comment with corresponding suggestion
    @suggestion = Suggestion.find(params[:suggestion_id])
    @comment.suggestion = @suggestion
    @comment.save
    redirect_to suggestion_path(@suggestion)
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end
end
