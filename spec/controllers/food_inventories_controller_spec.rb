# spec/controllers/food_inventories_controller_spec.rb
require 'rails_helper'

RSpec.describe FoodInventoriesController, type: :controller do
  let(:user) { create(:user) }
  let(:inventory) { create(:inventory, user:) }
  let(:food) { create(:food, user:) }
  let(:food_inventory) { create(:food_inventory, inventory:, food:) }

  before do
    sign_in(user)
  end

  describe 'GET #new' do
    it 'returns a success response' do
      get :new, params: { inventory_id: inventory.id }
      expect(response).to be_successful
    end

    # Add more tests as needed
  end

  describe 'POST #create' do
    context 'with valid parameters' do
      it 'creates a new food_inventory' do
        expect do
          post :create,
               params: { food_inventory: attributes_for(:food_inventory, inventory_id: inventory.id, food_id: food.id) }
        end.to change(FoodInventory, :count).by(1)
      end

      it 'redirects to the inventory show page' do
        post :create,
             params: { food_inventory: attributes_for(:food_inventory, inventory_id: inventory.id, food_id: food.id) }
        expect(response).to redirect_to(inventory_path(inventory))
      end
    end

    context 'with invalid parameters' do
      it 'does not create a new food_inventory' do
        expect do
          post :create, params: { food_inventory: { quantity: nil, inventory_id: inventory.id, food_id: food.id } }
        end.to_not change(FoodInventory, :count)
      end

      it 'renders the new template' do
        post :create, params: { food_inventory: { quantity: nil, inventory_id: inventory.id, food_id: food.id } }
        expect(response).to render_template(:new)
      end
    end
  end

  describe 'DELETE #destroy' do
    it 'destroys the requested food_inventory' do
      food_inventory_to_destroy = create(:food_inventory, inventory:, food:)
      expect do
        delete :destroy, params: { id: food_inventory_to_destroy.id }
      end.to change(FoodInventory, :count).by(-1)
    end

    it 'redirects to the inventory show page' do
      delete :destroy, params: { id: food_inventory.id }
      expect(response).to redirect_to(inventory_path(inventory))
    end
  end
end
