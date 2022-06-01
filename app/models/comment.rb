class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :suggestion
  validates :title, :content, presence: true
  validates :content, length: { maximum: 50 }
end
