class CommentsController < ApplicationController
  before_action :set_comment, only: %i[upvote downvote]

  def create
    @comment = Comment.new(comment_params)
    # we need `suggestion_id` to associate comment with corresponding suggestion
    @suggestion = Suggestion.find(params[:suggestion_id])
    @comment.suggestion = @suggestion
    @comment.save
    redirect_to suggestion_path(@suggestion)
  end

  def destroy
    @comment.destroy
    redirect_to controller: :users_controller, action: :show
  end

  def upvote
    @comment.liked_by current_user
    redirect_to suggestion_path(Suggestion.find(@comment.suggestion_id), anchor: "comment-#{@comment.id}")
  end

  def downvote
    @comment.downvote_from current_user
    redirect_to suggestion_path(Suggestion.find(@comment.suggestion_id), anchor: "comment-#{@comment.id}")
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end

  def set_comment
    @comment = Comment.find(params[:id])
  end
end
