class EditColumnAgeofUsers < ActiveRecord::Migration[6.1]
  def change
    rename_column :users, :age, :birthday
  end
end
