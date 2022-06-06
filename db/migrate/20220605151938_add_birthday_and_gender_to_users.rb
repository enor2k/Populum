class AddBirthdayAndGenderToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :age, :date
    add_column :users, :gender, :string
  end
end
