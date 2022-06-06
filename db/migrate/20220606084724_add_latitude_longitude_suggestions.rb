class AddLatitudeLongitudeSuggestions < ActiveRecord::Migration[6.1]
  def change
    add_column :suggestions, :latitude, :float
    add_column :suggestions, :longitude, :float
  end
end
