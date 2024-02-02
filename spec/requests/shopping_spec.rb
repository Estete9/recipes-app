require 'rails_helper'

RSpec.describe 'Shoppings', type: :request do
  describe 'GET /generate_shopping_list' do
    it 'returns http success' do
      get '/shopping/generate_shopping_list'
      expect(response).to have_http_status(:success)
    end
  end
end
