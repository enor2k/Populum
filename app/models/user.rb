class User < ApplicationRecord
  has_one_attached :avatar
  has_many :suggestions, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :answers
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :suggestion_votes, dependent: :destroy
  has_many :comment_votes, dependent: :destroy

  acts_as_voter


  GENDERS = ["femme", "homme", "non-binaire"]
end
