class Suggestion < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  validates :title, :content, :address, presence: true
end
