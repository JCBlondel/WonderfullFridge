class Recipe < ApplicationRecord
  has_many :quantities, foreign_key: 'recipe_id', dependent: :destroy
  has_many :ingredients, through: :quantities

  validates :name, presence: true
  validates :name, uniqueness: true
end
