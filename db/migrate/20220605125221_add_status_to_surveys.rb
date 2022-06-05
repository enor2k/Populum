class AddStatusToSurveys < ActiveRecord::Migration[6.1]
  def change
    add_column :surveys, :active?, :boolean, default: false
  end
end
