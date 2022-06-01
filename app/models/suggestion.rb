class Suggestion < ApplicationRecord
  belongs_to :user
  has_may :comments, dependent: :destroy
  validates :title, :content, :address, presence: true
  validates :content, length: { minimum: 20, maximum: 250 }
end
