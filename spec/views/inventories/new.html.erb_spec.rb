require 'rails_helper'

RSpec.describe 'inventories/new', type: :view do
  let(:inventory) { build(:inventory) }
  let(:user) { create(:user) }

  before do
    assign(:inventory, inventory)
    assign(:user, user)
    render
  end

  it 'renders new inventory form' do
    assert_select 'form[action=?][method=?]', inventories_path, 'post' do
      assert_select 'input[name=?]', 'inventory[name]'
      assert_select 'textarea[name=?]', 'inventory[description]'
    end
  end
end
