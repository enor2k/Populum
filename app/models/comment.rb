class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :suggestion

  has_many :comment_vote, dependent: :destroy
  validates :content, presence: true

end
