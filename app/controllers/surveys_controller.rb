class SurveysController < ApplicationController
  before_action :set_survey, only: %i[edit show update respond archive]

  def index
    @surveys = Survey.where(:active? == true)
  end

  def show
  end

  def new
    @survey = Survey.new
  end

  def create
    @survey = Survey.new(survey_params)
    @survey.user_id = current_user.id
    if @survey.save
      redirect_to surveys_path
    else
      render :new
    end
  end

  def edit
  end

  def respond
  end

  def update
    @survey.update(survey_params)
    redirect_to survey_path(@survey)
  end

  def archive
    @survey.update(active?: false)
  end

  private

  def set_survey
    @survey = Survey.find(params[:id])
  end

  def survey_params
    params.require(:survey).permit(
      :title,
      :overview,
      :start_date,
      :end_date,
      questions_attributes: [
        :_destroy,
        :id,
        :answer_type,
        :title,
        options_attributes: [
          :_destroy,
          :id,
          :title
        ]
      ]
    )
  end
end
