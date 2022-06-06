class City::SurveysController < ApplicationController
  before_action :set_survey, only: %i[edit show update respond archive display]

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
    @survey.update(active?: true)
    @survey.user_id = current_user.id
    if @survey.save
      redirect_to city_surveys_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    @survey.update(survey_params)
    redirect_to city_survey_path(@survey)
  end

  def archive
    @survey.update(active?: false)
    redirect_to city_surveys_path
  end

  def display
    @data_keys = ['18-25', '25-35', '35-45', '45-55', '55-65', '65+']
    @data_values = [12, 19, 3, 5, 2, 3]
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
