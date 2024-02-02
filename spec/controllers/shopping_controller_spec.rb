# spec/controllers/shopping_controller_spec.rb

require 'rails_helper'

RSpec.describe ShoppingController, type: :controller do
  describe 'GET #generate_shopping_list' do
    let(:user) { create(:user) }
    let(:inventory) { create(:inventory, user: user) }
    let(:recipe) { create(:recipe, user: user) }
    let(:food) { create(:food, user: user, name: 'Tangelo') } # Explicitly set the name

    before do
      create(:food_inventory, food: food, inventory: inventory)
      create(:food_recipe, recipe: recipe, food: food)

      get :generate_shopping_list, params: { user_id: inventory.id, recipe_id: recipe.id }
    end

    it 'renders the generate_shopping_list template' do
      expect(response).to render_template('shopping/generate_shopping_list')
    end
  end
end
