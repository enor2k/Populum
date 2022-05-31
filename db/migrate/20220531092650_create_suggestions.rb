class CreateSuggestions < ActiveRecord::Migration[6.1]
  def change
    create_table :suggestions do |t|
      t.string :title
      t.text :content
      t.integer :votes
      t.string :address
      t.string :status
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
