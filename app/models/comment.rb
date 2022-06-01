class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :suggestion
  has_many :comment_vote, dependent: :destroy
end
