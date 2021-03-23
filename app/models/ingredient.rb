class Ingredient < ApplicationRecord
  has_many :quantities, foreign_key: 'ingredient_id', dependent: :destroy
  has_many :recipes, through: :quantities

  validates :name, presence: true
  validates :name, uniqueness: true
end
