# spec/features/food_inventories_spec.rb
require 'rails_helper'

RSpec.feature 'Food Inventories', type: :feature do
  let(:user) { create(:user) }
  let(:inventory) { create(:inventory, user:) }
  let(:food) { create(:food, user:) }

  before do
    login_as(user, scope: :user)
  end

  scenario 'User adds a new food to an inventory' do
    # Visit the page

    create(:food_inventory, inventory:, food:)

    visit new_food_inventory_path(inventory_id: inventory.id)

    # Explicitly wait for the dropdown to be present before interacting
    select_field = find('#food_inventory_food_id', wait: 20)

    select_field.click

    # Select the option using the visible text
    select_field.select food.name

    fill_in 'Quantity', with: 10

    click_button 'Add to Inventory'

    expect(page).to have_content(food.name)
    expect(page).to have_content(food.measurement_unit)
  end
end
