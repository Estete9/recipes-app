require 'rails_helper'

RSpec.feature 'Inventories', type: :feature do
  let(:user) { create(:user) }

  before do
    login_as(user, scope: :user)
  end

  scenario 'User creates a new recipe' do
    visit new_recipe_path

    fill_in 'Name', with: 'New recipe Name'
    fill_in 'Cooking time', with: 'Description of the recipe'
    fill_in 'Preparation time', with: 'Description of the recipe'
    fill_in 'Description', with: 'Description of the recipe'

    click_button 'Save'

    expect(page).to have_content('New recipe Name')
    expect(page).to have_content('Description of the recipe')
  end
end
