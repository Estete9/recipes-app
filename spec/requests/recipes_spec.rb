require 'rails_helper'

RSpec.describe 'Recipes', type: :request do
  let(:user) { create(:user) }
  let(:recipe) { create(:recipe, user:) }

  before do
    sign_in user
  end

  describe 'GET /recipes' do
    it 'renders the index template' do
      get recipes_path
      expect(response).to render_template(:index)
    end

    # Add more tests as needed
  end

  describe 'GET /recipes/:id' do
    it 'renders the show template' do
      get recipe_path(recipe)
      expect(response).to render_template(:show)
    end

    # Add more tests as needed
  end

  describe 'GET /recipes/new' do
    it 'renders the new template' do
      get new_recipe_path
      expect(response).to render_template(:new)
    end

    # Add more tests as needed
  end

  describe 'POST /recipes' do
    context 'with valid parameters' do
      it 'creates a new recipe' do
        expect do
          post recipes_path, params: { recipe: attributes_for(:recipe) }
        end.to change(Recipe, :count).by(1)
      end
    end

    context 'with invalid parameters' do
      it 'does not create a new recipe' do
        expect do
          post recipes_path, params: { recipe: { name: nil } }
        end.to_not change(Recipe, :count)
      end

      it 'renders the new template' do
        post recipes_path, params: { recipe: { name: nil } }
        expect(response).to render_template(:new)
      end
    end
  end

  describe 'DELETE /recipes/:id' do
    it 'destroys the requested recipe' do
      recipe_to_destroy = create(:recipe, user:)
      expect do
        delete recipe_path(recipe_to_destroy)
      end.to change(Recipe, :count).by(-1)
    end

    it 'redirects to the recipes list' do
      delete recipe_path(recipe)
      expect(response).to redirect_to(recipes_path)
    end
  end
end
