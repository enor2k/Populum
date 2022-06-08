class ChangeStatusToSuggestions < ActiveRecord::Migration[6.1]
  def change
    change_column :suggestions, :status, :string, default: "pending"
  end
end
