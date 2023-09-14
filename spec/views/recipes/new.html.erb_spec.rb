# spec/views/recipes/new.html.erb_spec.rb

require 'rails_helper'

RSpec.describe 'recipes/new.html.erb', type: :view do
  before do
    assign(:recipe, Recipe.new)
    assign(:users, [User.new(id: 1, name: 'User 1'), User.new(id: 2, name: 'User 2')])
    render
  end

  it 'renders the new recipe form' do
    expect(rendered).to have_selector("form[action='#{recipes_path}'][method='post']")

    expect(rendered).to have_field('recipe_name')
    expect(rendered).to have_field('recipe_preparation_time')
    expect(rendered).to have_field('recipe_cooking_time')
    expect(rendered).to have_field('recipe_description')
    expect(rendered).to have_select('recipe_user_id', options: ['User 1', 'User 2'])

    expect(rendered).to have_button('Create Recipe')
  end
end
