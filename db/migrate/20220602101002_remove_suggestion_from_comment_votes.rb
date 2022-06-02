class RemoveSuggestionFromCommentVotes < ActiveRecord::Migration[6.1]
  def change
    remove_reference :comment_votes, :suggestion, null: false, foreign_key: true
    add_reference :comment_votes, :comment, null: false, index: true, foreign_key: true
  end
end
