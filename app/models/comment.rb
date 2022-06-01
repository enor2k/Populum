class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :suggestion
  validates :content, presence: true

end
