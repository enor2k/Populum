class Suggestion < ApplicationRecord
  belongs_to :user
  has_many :suggestion_votes, dependent: :destroy
end
