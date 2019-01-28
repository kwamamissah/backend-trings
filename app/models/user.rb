class User < ApplicationRecord
  has_many :comments
  has_many :likes, dependent: :destroy
  has_many :city_gems, through: :likes

  validates :username, uniqueness: { case_sensitive: false }
end
