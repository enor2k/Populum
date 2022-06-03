class RemoveOldVotingTables < ActiveRecord::Migration[6.1]
  def change
    drop_table :comment_votes
    drop_table :suggestion_votes
  end
end
