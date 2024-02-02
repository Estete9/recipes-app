require 'rails_helper'

RSpec.describe 'recipes/index', type: :view do
  let(:user) { create(:user) }
  before(:each) do
    assign(:recipes, [
             Recipe.create!(
               name: 'Name',
               preparation_time: 'Preparation Time',
               cooking_time: 'Cooking Time',
               description: 'MyText',
               public: true,
               user:
             ),
             Recipe.create!(
               name: 'Name',
               preparation_time: 'Preparation Time',
               cooking_time: 'Cooking Time',
               description: 'MyText',
               public: true,
               user:
             )
           ])
  end

  it 'renders a list of recipes' do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'div>h5'
    assert_select cell_selector, text: Regexp.new('MyText'.to_s), count: 2
  end
end
