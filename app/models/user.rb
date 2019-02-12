class User < ApplicationRecord
  has_many :comments
  has_many :ratings
  has_many :likes, dependent: :destroy
  has_many :city_gems, through: :likes

  has_secure_password
  validates :first_name, :last_name, uniqueness: true
  validates :username, uniqueness: true, case_sensitive: false
  validates :email, presence: true, uniqueness: true, format:{
    with: /.+\@.+\../, message: "must be a valid email"
  }

  def profile_json
    {
      name: self.name,
      example: self.example,
      favorites: self.city_gems,
      interest: CityGem.all.sample(5)
    }.to_json
  end

end
