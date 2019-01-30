class Category < ApplicationRecord
  has_many :city_gems, inverse_of: :category
end
