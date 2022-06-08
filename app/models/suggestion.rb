class Suggestion < ApplicationRecord
  has_one_attached :photo
  belongs_to :user
  acts_as_votable

  has_many :comments, dependent: :destroy
  validates :title, :content, :address, presence: true

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  validates :status, presence: true
  STATUSES = %i[pending accepted done].map(&:to_s).freeze
  validates :status, inclusion: { in: %w[pending accepted done] }
end
