class Ingredient < ApplicationRecord
  has_many :doses
  # has_many :cocktail, through: :doses

  validates :name, presence: true
  validates :name, uniqueness: true
end
