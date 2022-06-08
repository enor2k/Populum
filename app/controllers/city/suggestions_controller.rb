class City::SuggestionsController < ApplicationController
  before_action :set_suggestion, only: %i[upvote downvote]

  def dashboard
    @suggestions = Suggestion.order(cached_votes_score: :desc).limit(5)
    @suggestion = @suggestions.first
    @comment = Comment.new
    if params[:param].present?
      @suggestion_focus = Suggestion.find(params[:param])
    else
      @suggestion_focus = Suggestion.first
    end
  end

  def upvote
    @suggestion.liked_by current_user
    redirect_to city_suggestions_dashboard_path
  end

  def downvote
    @suggestion.downvote_from current_user
    redirect_to city_suggestions_dashboard_path
  end

  private

  def suggestion_params
    params.require(:suggestion).permit(:title, :content, :address, :photo)
  end

  def set_suggestion
    @suggestion = Suggestion.find(params[:id])
  end
end
