class SuggestionsController < ApplicationController
  before_action :set_suggestion, only: %i[edit destroy show update upvote downvote]

  def index
    @suggestions = Suggestion.all
  end

  def show
    @suggestion_vote = SuggestionVote.new
    @votes_count = @suggestion.suggestion_votes.pluck(:value).map(&:to_i).sum
    @comments = Comment.where(suggestion_id: @suggestion.id)
    @comment_vote = CommentVote.new
  end

  def new
    @suggestion = Suggestion.new
  end

  def create
    @suggestion = Suggestion.new(suggestion_params)
    @suggestion.user = current_user

    if @suggestion.save
      redirect_to @suggestion
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @suggestion.update(suggestion_params)
      redirect_to controller: :users_controller, action: :show
    else
      render :edit
    end
  end

  def destroy
    @suggestion.destroy
    redirect_to controller: :users_controller, action: :show
  end

  def upvote
    @suggestion.liked_by current_user
    redirect_to root_path(anchor: "suggestion-#{@suggestion.id}")
  end

  def downvote
    @suggestion.downvote_from @user2
    redirect_to root_path(anchor: "suggestion-#{@suggestion.id}")
  end

  private

  def suggestion_params
    params.require(:suggestion).permit(:title, :content, :address)
  end

  def set_suggestion
    @suggestion = Suggestion.find(params[:id])
  end
end
