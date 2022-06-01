class AnswersController < ApplicationController
  def new
    @answer = Answer.new
    @question = Question.find(params[:question_id])
    @survey = Survey.find(params[:survey_id])
  end

  def create
    raise
  end
end
