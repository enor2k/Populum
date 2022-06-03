class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :suggestion
  acts_as_votable

  validates :content, presence: true
end
