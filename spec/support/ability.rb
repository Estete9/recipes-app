# spec/support/ability.rb

RSpec.configure do |config|
  config.before(:each, type: :view) do
    user = create(:user) # Create a user with necessary roles
    assign(:current_user, user)
    @ability = Ability.new(user)
    allow(view).to receive(:can?).and_return { |*args| @ability.can?(*args) }
  end
end
