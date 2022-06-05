class Suggestion < ApplicationRecord
  has_one_attached :photo
  belongs_to :user
  acts_as_votable

  has_many :comments, dependent: :destroy
  validates :title, :content, :address, presence: true
end
