class Suggestion < ApplicationRecord
  belongs_to :user
  acts_as_votable

  has_many :suggestion_votes, dependent: :destroy
  has_many :comments, dependent: :destroy
  validates :title, :content, :address, presence: true
end
