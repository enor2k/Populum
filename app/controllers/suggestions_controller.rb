class SuggestionsController < ApplicationController

  def show
    @suggestion = Suggestion.find(params[:id])
  end

  def new
    @suggestion = Suggestion.new
  end

  def create
    @suggestion = Suggestion.new(suggestion_params)
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
    params.require(:suggestion).permit(:title, :content, :votes, :address, :status, :user_id)
  end
end
