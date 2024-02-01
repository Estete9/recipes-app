require 'rails_helper'

RSpec.describe "FoodInventories", type: :request do
  let(:user) { create(:user) }
  let(:inventory) { create(:inventory, user:) }
  let(:food) { create(:food, user:) }
  let(:food_inventory) { create(:food_inventory, inventory:, food:) }

  before do
    sign_in user
  end

  describe 'GET /food_inventories/new' do
    it 'renders the new template' do
      get new_food_inventory_path(inventory_id: inventory.id)
      expect(response).to render_template(:new)
    end

    # Add more tests as needed
  end

  describe 'POST /food_inventories' do
    context 'with valid parameters' do
      it 'creates a new food_inventory' do
        expect do
          post food_inventories_path,
               params: { food_inventory: attributes_for(:food_inventory, inventory_id: inventory.id, food_id: food.id) }
        end.to change(FoodInventory, :count).by(1)
      end

      it 'redirects to the inventory show page' do
        post food_inventories_path,
             params: { food_inventory: attributes_for(:food_inventory, inventory_id: inventory.id, food_id: food.id) }
        expect(response).to redirect_to(inventory_path(inventory))
      end
    end

    context 'with invalid parameters' do
      it 'does not create a new food_inventory' do
        expect do
          post food_inventories_path,
               params: { food_inventory: { quantity: nil, inventory_id: inventory.id, food_id: food.id } }
        end.to_not change(FoodInventory, :count)
      end

      it 'renders the new template' do
        post food_inventories_path,
             params: { food_inventory: { quantity: nil, inventory_id: inventory.id, food_id: food.id } }
        expect(response).to render_template(:new)
      end
    end
  end

  describe 'DELETE /food_inventories/:id' do
    it 'destroys the requested food_inventory' do
      food_inventory_to_destroy = create(:food_inventory, inventory:, food:)
      expect do
        delete food_inventory_path(food_inventory_to_destroy)
      end.to change(FoodInventory, :count).by(-1)
    end

    it 'redirects to the inventory show page' do
      delete food_inventory_path(food_inventory)
      expect(response).to redirect_to(inventory_path(inventory))
    end
  end
end
