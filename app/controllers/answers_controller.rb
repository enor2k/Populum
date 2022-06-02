class AnswersController < ApplicationController
  def new
    @answer = Answer.new
    @question = Question.find(params[:question_id])
    @survey = Survey.find(params[:survey_id])
    @option
  end

  def create
    @answer = Answer.new(params_answer)
    @survey = Survey.find(Question.find(params[:question_id]).survey_id)
    @answer.user = current_user
    if @answer.save
      flash[:alert] = 'Réponse enregistrée!'
      redirect_to surveys_respond_path(@survey)
    end
  end

  private

  def params_answer
    if params[:answer].present?
      return params.permit(:question_id, :option_id).merge(params.require(:answer).permit(:answer_fields))
    end

    params.permit(:question_id, :option_id)
  end
end
