class FoodRecipe < ApplicationRecord
  belongs_to :food
  belongs_to :recipe

   def quantity_with_measurement_unit
    "#{quantity} (#{food.measurement_unit})"
  end
end
