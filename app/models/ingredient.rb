class Ingredient < ApplicationRecord
  has_many :doses
  has_many :images

  validates :name, presence: true, uniqueness: :true
end
