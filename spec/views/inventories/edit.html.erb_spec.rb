# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'inventories/edit', type: :view do
  let(:inventory) do
    Inventory.create!(
      name: 'MyString',
      user: nil
    )
  end

  before(:each) do
    assign(:inventory, inventory)
  end

  it 'renders the edit inventory form' do
    render

    assert_select 'form[action=?][method=?]', inventory_path(inventory), 'post' do
      assert_select 'input[name=?]', 'inventory[name]'

      assert_select 'input[name=?]', 'inventory[user_id]'
    end
  end
end
