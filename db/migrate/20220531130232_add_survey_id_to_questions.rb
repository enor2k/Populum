class AddSurveyIdToQuestions < ActiveRecord::Migration[6.1]
  def change
    add_reference :questions, :survey, null: false, foreign_key: true
  end
end
