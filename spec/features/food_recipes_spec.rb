# spec/features/food_inventories_spec.rb
require 'rails_helper'

RSpec.feature 'FoodRecipes', type: :feature do
  let(:user) { create(:user) }
  let(:recipe) { create(:recipe, user:) }
  let(:food) { create(:food, user:) }

  before do
    login_as(user, scope: :user)
  end

  scenario 'User adds a new food to an recipe' do
    # Visit the page

    create(:food_recipe, recipe:, food:)

    visit new_food_recipe_path(recipe_id: recipe.id)

    # Explicitly wait for the dropdown to be present before interacting
    select_field = find('#recipe-food-select', wait: 20)

    select_field.click

    # Select the option using the visible text
    select_field.select food.name

    fill_in 'Quantity', with: 10

    click_button 'Save'

    expect(page).to have_content(food.name)
    expect(page).to have_content(food.measurement_unit)
  end
end
