# spec/features/recipe_show_spec.rb

require 'rails_helper'

RSpec.feature 'Recipe Show Page' do
  let(:user) { create(:user) }
  let(:recipe) { create(:recipe, user: user) }
  let(:recipe_food) { create(:recipe_food, recipe: recipe) }

  before do
    login_as(user) # Assuming you have a login helper
    visit recipe_path(recipe)
  end

  scenario 'displays recipe details' do
    expect(page).to have_content(recipe.name)
    expect(page).to have_content("Preparation-Time: #{recipe.preparation_time} hours")
    expect(page).to have_content("Cooking-Time: #{recipe.cooking_time} hours")
  end

  scenario 'displays shopping list and add ingredient buttons for the owner' do
    expect(page).to have_link('Generate shopping List', href: shopping_lists_path(recipe))
    expect(page).to have_link('Add Ingredient', href: new_recipe_recipe_food_path(recipe))
  end
end
