class RemoveQuestionIdFropSurveys < ActiveRecord::Migration[6.1]
  def change
    remove_column :surveys, :question_id
  end
end
