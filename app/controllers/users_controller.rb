class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @suggestions = Suggestion.where(user_id: current_user).order(created_at: :desc)
  end
end
