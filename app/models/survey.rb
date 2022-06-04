class Survey < ApplicationRecord
  has_many :questions
  accepts_nested_attributes_for :questions, allow_destroy: true
  belongs_to :user
end
