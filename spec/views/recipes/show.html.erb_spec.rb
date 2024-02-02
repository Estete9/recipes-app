require 'rails_helper'

RSpec.describe 'recipes/show', type: :view do
  let(:user) { create(:user) }
  let(:food) { create(:food, user: user) }
  before(:each) do
    recipe = Recipe.create!(
      name: 'Name',
      preparation_time: 'Preparation Time',
      description: 'MyText',
      cooking_time: 'Cooking Time',
      public: true,
      user: user
      )
    assign(:food_recipes, create(:food_recipe, quantity: 1, recipe: recipe, food: food))
  end

  it 'renders a not logged in user warning' do
    render
    expect(rendered).to match(/Sorry/)
  end
end
