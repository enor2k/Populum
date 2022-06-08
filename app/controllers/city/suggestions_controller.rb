class City::SuggestionsController < ApplicationController
  before_action :set_suggestion, only: %i[destroy edit show update upvote downvote]

  def index
    @suggestions = Suggestion.all
  end

  def update
    if @suggestion.update(suggestion_params)
      redirect_to user_path(current_user)
    else
      render :edit
    end
  end

  def dashboard
    @suggestions = Suggestion.all
    @suggestion = @suggestions.first
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

  def change_status
    @suggestion = Suggestion.find(params[:id])

    if params[:status].present? && Suggestion::STATUSES.include?(params[:status])
      @suggestion.update(status: params[:status])
    end
    redirect_to("/city/suggestions/dashboard/?&param=#{@comment.suggestion_id}")
  end

  private

  def suggestion_params
    params.require(:suggestion).permit(:title, :content, :address, :photo)
  end

  def set_suggestion
    @suggestion = Suggestion.find(params[:id])
  end
end
