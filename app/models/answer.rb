class Answer < ApplicationRecord
  belongs_to :user
  belongs_to :question
  belongs_to :option
end
