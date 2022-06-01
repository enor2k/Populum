class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :suggestion
<<<<<<< HEAD
  has_many :comment_vote, dependent: :destroy
=======
  validates :content, presence: true

>>>>>>> master
end
