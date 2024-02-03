require 'rails_helper'

RSpec.describe 'inventories/show', type: :view do
  let(:user) { create(:user) }
  let(:inventory) { create(:inventory, user:) }
  let(:food) { create(:food, user:) }
  let(:food_inventory) { create(:food_inventory, quantity: 1, inventory:, food:) }

  before do
    assign(:inventory, inventory)
    assign(:user, user)
    assign(:food_inventories, [food_inventory])
    render
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(inventory.name)
    expect(rendered).to match(food.name)
    expect(rendered).to match(food_inventory.quantity.to_s)
    expect(rendered).to match(food.measurement_unit)
    expect(rendered).to match('Remove')
  end
end
