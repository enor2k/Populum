class PreventNullFromAwnserTypeonQuestions < ActiveRecord::Migration[6.1]
  def change
    change_column :questions, :answer_type, :string, null: false
  end
end
