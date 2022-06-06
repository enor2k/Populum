class SuggestionsController < ApplicationController
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

  private

  def suggestion_params
    params.require(:suggestion).permit(:title, :content, :address, :photo)
  end

  def set_suggestion
    @suggestion = Suggestion.find(params[:id])
  end
end
