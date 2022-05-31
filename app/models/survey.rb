class Survey < ApplicationRecord
  belongs_to :questio
  belongs_to :user
end
