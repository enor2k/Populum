class SurveysController < ApplicationController
  before_action :set_survey, only: %i[respond]

  def respond
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
