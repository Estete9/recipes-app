class ShoppingController < ApplicationController
  # ...

  def generate_shopping_list
    inventory_id = params[:user_id]
    recipe_id = params[:recipe_id]
    @inventory = Inventory.find(inventory_id)
    @recipe = Recipe.find_by(id: recipe_id)

    @food_inventory = @inventory.foods
    @food_recipe = @recipe.foods

    # Find the missing foods
    @missing_foods = @food_recipe - @food_inventory

    # Calculate the total quantity and total price
    @total_quantity = @missing_foods.size
    @total_price = @missing_foods.sum { |food| food.price * @recipe.food_quantity(food) }

    render 'generate_shopping_list'
  end
end
