class SuggestionsController < ApplicationController
  before_action :set_suggestion, only: %i[destroy edit show update upvote downvote]

  def index
    @suggestions = Suggestion.all
    @markers = @suggestions.geocoded.map do |flat|
      {
        lat: flat.latitude,
        lng: flat.longitude
      }
    end
  end

  def show
    @comment = Comment.new
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
      redirect_to user_path(current_user)
    else
      render :edit
    end
  end

  def destroy
    @suggestion.destroy
    redirect_to user_path(current_user)
  end

  def upvote
    @suggestion.liked_by current_user
    redirect_to root_path(anchor: "suggestion-#{@suggestion.id}")
  end

  def downvote
    @suggestion.downvote_from current_user
    redirect_to root_path(anchor: "suggestion-#{@suggestion.id}")
  end

  private

  def suggestion_params
    params.require(:suggestion).permit(:title, :content, :address, :photo)
  end

  def set_suggestion
    @suggestion = Suggestion.find(params[:id])
  end
end
