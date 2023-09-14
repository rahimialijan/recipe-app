# spec/views/recipes/index.html.erb_spec.rb

require 'rails_helper'

RSpec.describe 'recipes/index.html.erb', type: :view do
  it 'displays a list of recipes' do
    # Create some sample recipes for the test
    recipe1 = FactoryBot.create(:recipe, name: 'Pizza', description: 'Delicious pizza recipe')
    recipe2 = FactoryBot.create(:recipe, name: 'Burger', description: 'Tasty burger recipe')

    # Assign the recipes to the view
    assign(:recipes, [recipe1, recipe2])

    # Render the view
    render

    # Verify that the rendered HTML contains the expected content
    expect(rendered).to have_content('List of Recipe')
    expect(rendered).to have_content('Pizza')
    expect(rendered).to have_content('Burger')
    expect(rendered).to have_content('Delicious pizza recipe')
    expect(rendered).to have_content('Tasty burger recipe')
    expect(rendered).to have_link('Pizza', href: recipe_path(recipe1))
    expect(rendered).to have_link('Burger', href: recipe_path(recipe2))
  end
end
