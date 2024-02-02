require 'rails_helper'

RSpec.describe 'FoodRecipes', type: :request do
  let(:user) { create(:user) }
  let(:recipe) { create(:recipe, user:) }
  let(:food) { create(:food, user:) }
  let(:food_recipe) { create(:food_recipe, recipe:, food:) }

  before do
    sign_in user
  end

  describe 'GET /food_recipes/new' do
    it 'renders the new template' do
      get new_food_recipe_path(recipe_id: recipe.id)
      expect(response).to render_template(:new)
    end

    # Add more tests as needed
  end

  describe 'POST /food_recipes' do
    context 'with valid parameters' do
      it 'creates a new food recipe' do
        expect do
          post food_recipes_path,
               params: { food_recipe: attributes_for(:food_recipe, recipe_id: recipe.id, food_id: food.id) }
        end.to change(FoodRecipe, :count).by(1)
      end
    end

    context 'with invalid parameters' do
      it 'does not create a new food_recipe' do
        expect do
          post food_inventories_path,
               params: { food_recipe: { quantity: nil, recipe_id: recipe.id } }
        end.to_not change(FoodRecipe, :count)
      end
    end
  end

  describe 'DELETE /food_recipes/:id' do
    it 'destroys the requested food recipe' do
      food_recipe_to_destroy = create(:food_recipe, recipe:, food:)
      expect do
        delete food_recipe_path(food_recipe_to_destroy)
      end.to change(FoodRecipe, :count).by(-1)
    end

    it 'redirects to the recipe show page' do
      delete food_recipe_path(food_recipe)
      expect(response).to redirect_to(food_recipes_url)
    end
  end
end
