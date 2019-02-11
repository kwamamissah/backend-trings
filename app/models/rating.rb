class Rating < ApplicationRecord
  belongs_to :user
  belongs_to :city_gem

  validates :user_id, uniqueness: { scope: :city_gem_id }
  validates_inclusion_of :value, :in => 1..5
end
