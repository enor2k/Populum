class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :suggestion
  validates :content, presence: true
  validates :content, length: { maximum: 200 }
end
