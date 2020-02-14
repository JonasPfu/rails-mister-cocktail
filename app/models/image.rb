class Image < ApplicationRecord
  belongs_to :cocktail

  validates :title, presence: true
end
