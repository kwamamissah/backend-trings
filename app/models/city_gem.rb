class CityGem < ApplicationRecord
  has_many :comments
  has_many :likes, dependent: :destroy
  has_many :users, through: :likes
  belongs_to :category
end
