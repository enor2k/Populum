class Suggestion < ApplicationRecord
  has_one_attached :photo
  belongs_to :user
  acts_as_votable

  has_many :comments, dependent: :destroy
  validates :title, :content, :address, presence: true

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  scope :most_voted, -> { order(cached_votes_total: :desc) }
  scope :most_recent, -> { order(created_at: :desc) }

end
