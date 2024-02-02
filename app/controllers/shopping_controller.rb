class ShoppingController < ApplicationController
# app/controllers/shopping_controller.rb
def generate_shopping_list
  inventory_id = params[:user_id]
  recipe_id = params[:recipe_id]
  @inventory = Inventory.find(inventory_id)
  @recipe = Recipe.find_by(id: recipe_id)


  

  # You can use inventory_id and recipe_id as needed in your view or business logic
  @foods = @inventory.foods

  # Render the view for the shopping list
  render 'generate_shopping_list'
end

end
