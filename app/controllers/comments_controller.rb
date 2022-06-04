class CommentsController < ApplicationController
  before_action :set_comment, only: %i[upvote downvote destroy edit update]

  def create
    @comment = Comment.new(comment_params)
    @suggestion = Suggestion.find(params[:suggestion_id])
    @comment.suggestion = @suggestion
    @comment.user = current_user
    if @comment.save
      redirect_to suggestion_path(@suggestion)
    else
      render :new
    end
  end

  def edit
    @suggestion = Suggestion.find(params[:suggestion_id])
  end

  def update
    if @comment.update(comment_params)
      redirect_to suggestion_path(Suggestion.find(params[:suggestion_id]))
    else
      render :edit
    end
  end

  def destroy
    @comment.destroy
    redirect_to suggestion_path(Suggestion.find(@comment.suggestion_id))
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
