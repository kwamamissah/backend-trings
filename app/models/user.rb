class User < ApplicationRecord
  has_many :comments
  has_many :likes, dependent: :destroy
  has_many :city_gems, through: :likes

  has_secure_password
  validates :username, uniqueness: true, case_sensitive: false
  validates :email, presence: true, uniqueness: true, format:{
    with: /.+\@.+\../
  }
end
