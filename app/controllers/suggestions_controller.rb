class SuggestionsController < ApplicationController
  def index
    @suggestions = Suggestion.all
  end

  def show
    @suggestion = Suggestion.find(params[:id])

    @suggestion_vote = SuggestionVote.new
    @votes_count = @suggestion.suggestion_votes.pluck(:value).map(&:to_i).sum

    @comments = Comment.where(suggestion_id: @suggestion.id)
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
    @suggestion = Suggestion.find(params[:id])
  end

  def update
    @suggestion = Suggestion.find(params[:id])
    if @suggestion.update(suggestion_params)
      redirect_to controller: :users_controller, action: :show
    else
      render :edit
    end
  end

  def destroy
    @suggestion = Suggestion.find(params[:id])
    @suggestion.destroy
    redirect_to controller: :users_controller, action: :show
  end

  private

  def suggestion_params
    params.require(:suggestion).permit(:title, :content, :address)
  end
end
