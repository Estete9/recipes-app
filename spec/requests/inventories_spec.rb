require 'rails_helper'

RSpec.describe '/inventories', type: :request do
  let(:user) { create(:user) }
  let(:inventory) { create(:inventory, user:) }

  before do
    sign_in user
  end

  describe 'GET /inventories' do
    it 'renders the index template' do
      get inventories_path
      expect(response).to render_template(:index)
    end

    # Add more tests as needed
  end

  describe 'GET /inventories/:id' do
    it 'renders the show template' do
      get inventory_path(inventory)
      expect(response).to render_template(:show)
    end

    # Add more tests as needed
  end

  describe 'GET /inventories/new' do
    it 'renders the new template' do
      get new_inventory_path
      expect(response).to render_template(:new)
    end

    # Add more tests as needed
  end

  describe 'POST /inventories' do
    context 'with valid parameters' do
      it 'creates a new inventory' do
        expect do
          post inventories_path, params: { inventory: attributes_for(:inventory) }
        end.to change(Inventory, :count).by(1)
      end

      it 'redirects to the created inventory' do
        post inventories_path, params: { inventory: attributes_for(:inventory) }
        expect(response).to redirect_to(inventories_path)
      end
    end

    context 'with invalid parameters' do
      it 'does not create a new inventory' do
        expect do
          post inventories_path, params: { inventory: { name: nil } }
        end.to_not change(Inventory, :count)
      end

      it 'renders the new template' do
        post inventories_path, params: { inventory: { name: nil } }
        expect(response).to render_template(:new)
      end
    end
  end

  describe 'DELETE /inventories/:id' do
    it 'destroys the requested inventory' do
      inventory_to_destroy = create(:inventory, user:)
      expect do
        delete inventory_path(inventory_to_destroy)
      end.to change(Inventory, :count).by(-1)
    end

    it 'redirects to the inventories list' do
      delete inventory_path(inventory)
      expect(response).to redirect_to(inventories_path)
    end
  end
end
