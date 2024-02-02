require 'rails_helper'

RSpec.describe 'Shopping', type: :request do
  describe 'GET /shopping/generate_shopping_list' do
    it 'returns a success response' do
      # Create necessary data using FactoryBot
      user = create(:user)
      recipe = create(:recipe)
      inventory = create(:inventory, user:)
      food = create(:food, user:) # Add this line to create a food item
      # Assuming you have associated foods and food recipes in the database
      create(:food_recipe, recipe:, food:)
      create(:food_inventory, inventory:, food:)

      # Sign in the user
      sign_in user

      # Make a GET request to the generate_shopping_list path with the necessary parameters
      get generate_shopping_list_path(user_id: inventory.id, recipe_id: recipe.id)

      # Expect a successful response (HTTP status 200)
      expect(response).to have_http_status(:success)
      # You can add more expectations based on what you render in the action
      # For example, if you render a template, you can check if the template is rendered
      expect(response).to render_template(:generate_shopping_list)
    end
  end
end
