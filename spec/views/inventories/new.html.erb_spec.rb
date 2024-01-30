# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'inventories/new', type: :view do
  before(:each) do
    assign(:inventory, Inventory.new(
                         name: 'MyString',
                         user: nil
                       ))
  end

  it 'renders new inventory form' do
    render

    assert_select 'form[action=?][method=?]', inventories_path, 'post' do
      assert_select 'input[name=?]', 'inventory[name]'

      assert_select 'input[name=?]', 'inventory[user_id]'
    end
  end
end
