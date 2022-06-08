class RemoveStatusSuggestion < ActiveRecord::Migration[6.1]
  def change
    remove_column :suggestions, :status
  end
end
