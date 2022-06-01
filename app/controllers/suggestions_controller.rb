class SuggestionsController < ApplicationController
  def new
    @suggestion = Suggestion.new
  end

  def show
    @suggestion = Suggestion.find(params[:id])
    @suggestion_vote = SuggestionVote.new
    @votes_count = @suggestion.suggestion_votes.pluck(:value).map(&:to_i).sum
  end

  def create
    @suggestion = Suggestion.new(suggestion_params)
    if @suggestion.save
      redirect_to @suggestion
    else
      render :new
    end
  end

  private

  def suggestion_params
    params.require(:suggestion).permit(:title, :content, :votes, :address, :status, :user_id)
  end
end
