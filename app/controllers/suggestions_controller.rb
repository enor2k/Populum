class SuggestionsController < ApplicationController

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
end
