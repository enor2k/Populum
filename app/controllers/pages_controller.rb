class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    @suggestions = Suggestion.order(votes: :desc).limit(5)
    @users = User.order(score: :desc).limit(5)
  end
end
