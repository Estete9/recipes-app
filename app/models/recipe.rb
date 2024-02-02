class Recipe < ApplicationRecord
  belongs_to :user
  has_many :food_recipes
  has_many :foods, through: :food_recipes
  def total_price
    total = 0
    food_recipes.each do |rf|
      total += rf.food.price
    end
    total
  end
end
