class UsersController < ApplicationController
<<<<<<< HEAD

=======
  def show
    @user = User.find(params[:id])
    @suggestions = Suggestion.where(user_id: current_user)
  end
>>>>>>> master
end
