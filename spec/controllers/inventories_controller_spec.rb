require 'rails_helper'

RSpec.describe InventoriesController, type: :controller do
  let(:user) { create(:user) }
  let(:inventory) { create(:inventory, user:) }

  before do
    sign_in user
  end

  describe 'GET #index' do
    it 'returns a success response' do
      get :index
      expect(response).to be_successful
    end

    # Add more tests as needed
  end

  describe 'GET #show' do
    it 'returns a success response' do
      get :show, params: { id: inventory.id }
      expect(response).to be_successful
    end

    # Add more tests as needed
  end

  describe 'GET #new' do
    it 'returns a success response' do
      get :new
      expect(response).to be_successful
    end

    # Add more tests as needed
  end

  describe 'POST #create' do
    context 'with valid parameters' do
      it 'creates a new inventory' do
        expect do
          post :create, params: { inventory: attributes_for(:inventory) }
        end.to change(Inventory, :count).by(1)
      end

      it 'redirects to the inventories list' do
        post :create, params: { inventory: attributes_for(:inventory) }
        expect(response).to redirect_to(inventories_path)
      end
    end

    context 'with invalid parameters' do
      it 'does not create a new inventory' do
        expect do
          post :create, params: { inventory: { name: nil } }
        end.to_not change(Inventory, :count)
      end

      it 'renders the new template' do
        post :create, params: { inventory: { name: nil } }
        expect(response).to render_template(:new)
      end
    end
  end

  describe 'DELETE #destroy' do
    it 'destroys the requested inventory' do
      inventory_to_destroy = create(:inventory, user:)
      expect do
        delete :destroy, params: { id: inventory_to_destroy.id }
      end.to change(Inventory, :count).by(-1)
    end

    it 'redirects to the inventories list' do
      delete :destroy, params: { id: inventory.id }
      expect(response).to redirect_to(inventories_path)
    end
  end
end
