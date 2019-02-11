class CityGem < ApplicationRecord
  has_many :comments
  has_many :ratings
  has_many :likes, dependent: :destroy
  has_many :users, through: :likes
  belongs_to :category

  validates :name, :address, :img_url, :description,  presence: true
  # validates :description, presence: true, length: { in: 5..50 }
end
