class Question < ApplicationRecord
  belongs_to :survey
  has_many :answers, dependent: :destroy
  accepts_nested_attributes_for :answers, allow_destroy: true

  enum question_type: { single_choice: 0, multiple_choice: 1, long_answer: 2 }
end
