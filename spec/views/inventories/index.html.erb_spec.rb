# spec/views/inventories/index.html.erb_spec.rb

require 'rails_helper'
require 'pry'

RSpec.describe 'inventories/index', type: :view do
  let(:user) { create(:user) }
  let(:ability) { Ability.new(user) }

  before(:each) do
    allow(controller).to receive(:current_user).and_return(user)
    allow(controller).to receive(:current_ability).and_return(ability)

    # Grant the ability to destroy inventories
    ability.can(:destroy, Inventory)

    assign(:inventories, [
      create(:inventory, name: 'Inventory 1', description: 'Description 1', user: user),
      create(:inventory, name: 'Inventory 2', description: 'Description 2', user: user)
    ])

    sign_in user
  end

  it 'renders inventories' do
    render

    expect(rendered).to have_link('New inventory', href: new_inventory_path, class: 'btn btn-primary mb-4')

    # Check if each inventory is rendered
    expect(rendered).to have_selector('.inventory-item', count: 2)

    # Check if the inventory names and descriptions are present
    expect(rendered).to have_text('Inventory 1')
    expect(rendered).to have_text('Description 1')
    expect(rendered).to have_text('Inventory 2')
    expect(rendered).to have_text('Description 2')

    # Add additional expectations as needed based on your view content
  end

  it 'handles empty inventories' do
    assign(:inventories, []) # Empty inventories

    render

    expect(rendered).to have_link('New inventory', href: new_inventory_path, class: 'btn btn-primary mb-4')
    expect(rendered).to have_selector('.bg-light.border.rounded', text: 'Empty list for now')
  end
end
