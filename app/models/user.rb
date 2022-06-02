class User < ApplicationRecord
  has_many :suggestions, dependent: :destroy
  has_many :comments, dependent: :destroy
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :suggestion_votes, dependent: :destroy
  has_many :comment_votes, dependent: :destroy
end
