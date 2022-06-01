class AnswersController < ApplicationController
  def new
    @answer = Answer.new
    @question = Question.find(params[:question_id])
    @survey = Survey.find(params[:survey_id])
    @option
  end

  def create
    @answer = Answer.new(params_answer)
    @answer.user = current_user
    case params[:answer][:answer_type]
    when "single_choice"
      @answer.option_id = params[:answer][:option_id]
    when "multiple_choice"
      @answer.option_id = params[:answer][:option_1_id]
    when "long_answer"
      @answer.answer_fields = params[:answer][:answer_fields]
    end
    @answer.option_id = params[:answer][:option_id]
    @answer.save
  end

  private

  def params_answer
    params.permit(:question_id, :option_id, :answer_fields)
  end
end
