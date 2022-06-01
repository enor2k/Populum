class SuggestionVotesController < ApplicationController
  def new
  end

  def create
    @suggestion_vote = SuggestionVote.new(suggestion_vote_params)
    @suggestion = Suggestion.find(params[:suggestion_id])
    @suggestion_vote.suggestion = @suggestion

    @suggestion_vote.user = current_user
    @suggestion_vote.save

    redirect_to suggestion_path(@suggestion)
  end

  private

  def suggestion_vote_params
    params.require(:suggestion_vote).permit(:value)
  end
end
