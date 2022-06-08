class AddStatusToSuggestion < ActiveRecord::Migration[6.1]
  def change
    add_column :suggestions, :status, :integer, default: 0
  end
end
