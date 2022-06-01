class SurveysController < ApplicationController
  def index
    @surveys = Survey.all
  end

  def new
    @survey = Survey.new
  end

  def create
    @survey = Survey.new(survey_params)
    if @survey.save
      redirect_to surveys_path
    else
      render :new
    end
  end

  private

  def survey_params
    params.require(:survey).permit(:title, :overview, question_attributes: [:title, :answer_type, :id, :_destroy])
  end
end
