require 'rails_helper'

RSpec.describe RecipeFood, type: :model do
  it 'is valid with default quantity and associated recipe and food' do
    user = User.create(name: 'John Doe', email: 'john@example.com', password: 'password')
    recipe = user.recipes.create(name: 'Pizza')
    food = Food.create(name: 'Tomato', price: 2.0)
    recipe_food = RecipeFood.new(recipe: recipe, food: food)
    expect(recipe_food).to be_valid
    expect(recipe_food.quantity).to eq(1)
  end
end
