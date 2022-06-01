class Suggestion < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  validates :title, :content, :address, presence: true
  validates :content, length: { minimum: 20, maximum: 400 }
end
