class CommentVote < ApplicationRecord
  belongs_to :comment
  belongs_to :user
end
