class RemoveStatussSuggestions < ActiveRecord::Migration[6.1]
  def down
    remove_column :suggestions, :status
  end
end
