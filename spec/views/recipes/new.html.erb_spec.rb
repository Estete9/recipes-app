require 'rails_helper'

RSpec.describe 'recipes/new', type: :view do
  let(:user) { create(:user) }
  before(:each) do
    assign(:recipe, Recipe.new(
                      name: 'MyString',
                      preparation_time: 'MyString',
                      cooking_time: 'MyString',
                      description: 'MyText',
                      public: true,
                      user:
                    ))
  end

  it 'renders new recipe form' do
    render

    assert_select 'form[action=?][method=?]', recipes_path, 'post' do
      assert_select 'input[name=?]', 'recipe[name]'

      assert_select 'input[name=?]', 'recipe[preparation_time]'

      assert_select 'input[name=?]', 'recipe[cooking_time]'

      assert_select 'textarea[name=?]', 'recipe[description]'

      assert_select 'input[name=?]', 'recipe[public]'
    end
  end
end
