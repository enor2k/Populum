class AddStatusToSuggestions < ActiveRecord::Migration[6.1]
  def change
    add_column :suggestions, :status, :string
  end
end
