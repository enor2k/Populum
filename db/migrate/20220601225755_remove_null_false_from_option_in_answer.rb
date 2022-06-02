class RemoveNullFalseFromOptionInAnswer < ActiveRecord::Migration[6.1]
  def change
    change_column_null :answers, :option_id, true
  end
end
