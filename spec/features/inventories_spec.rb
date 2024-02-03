require 'rails_helper'

RSpec.feature 'Inventories', type: :feature do
  let(:user) { create(:user) }

  before do
    login_as(user, scope: :user)
  end

  scenario 'User creates a new inventory' do
    visit new_inventory_path

    fill_in 'Name', with: 'New Inventory Name'
    fill_in 'Description', with: 'Description of the inventory'

    click_button 'Create Inventory'

    expect(page).to have_content('Inventory was successfully created.')
    expect(page).to have_content('New Inventory Name')
    expect(page).to have_content('Description of the inventory')
  end
end
