class Survey < ApplicationRecord
  has_many :questions
  accepts_nested_attributes_for :questions, allow_destroy: true
  belongs_to :user

  def mean_user_age
    bdays = self.questions.last.answers.map { |a| User.find(a.user_id).birthday }
    ages = bdays.map { |bday| ((Time.zone.now - bday.to_time) / 1.year.seconds).floor }
    return ages.sum.fdiv(ages.size)
  end
end
