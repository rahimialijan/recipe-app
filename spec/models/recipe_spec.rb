require 'rails_helper'

RSpec.describe Recipe, type: :model do
  it 'is valid with a name' do
    user = User.create(name: 'Alijan', email: 'alijan@example.com', password: 'password')
    recipe = user.recipes.create(name: 'Pizza')
    expect(recipe).to be_valid
  end

  it 'is invalid without a name' do
    user = User.create(name: 'John Doe', email: 'john@example.com', password: 'password')
    recipe = user.recipes.build(name: nil)
    expect(recipe).not_to be_valid
  end
end
