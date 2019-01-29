class CityGem < ApplicationRecord
  has_many :comments
  has_many :likes, dependent: :destroy
  has_many :users, through: :likes
  belongs_to :category

  validates :name, presence: true
  validates :description, presence: true
  validates :address, presence: true
  validates :img_url, presence: true
  
end
