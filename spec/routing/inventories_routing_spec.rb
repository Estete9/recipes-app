require 'rails_helper'

RSpec.describe InventoriesController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/inventories').to route_to('inventories#index')
    end

    it 'routes to #new' do
      expect(get: '/inventories/new').to route_to('inventories#new')
    end

    it 'routes to #show' do
      expect(get: '/inventories/1').to route_to('inventories#show', id: '1')
    end

    it 'routes to #create' do
      expect(post: '/inventories').to route_to('inventories#create')
    end

    it 'routes to #destroy' do
      expect(delete: '/inventories/1').to route_to('inventories#destroy', id: '1')
    end
  end
end
