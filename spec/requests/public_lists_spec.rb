require 'rails_helper'

RSpec.describe 'public_recipes/index.html.erb', type: :view do
  before(:each) do
    assign(:public_recipes, [
             create(:recipe, name: 'Recipe 1', description: 'Description 1', user: create(:user, name: 'User 1')),
             create(:recipe, name: 'Recipe 2', description: 'Description 2', user: create(:user, name: 'User 2'))
           ])
  end

  it 'displays the title' do
    render
    expect(rendered).to have_selector('h2', text: 'Public Recipe List')
  end

  it 'displays a table of recipes with user names, food items, and total price' do
    render
    expect(rendered).to have_selector('table.table tbody tr', count: 2)
    expect(rendered).to have_content('Recipe 1 by User 1')
    expect(rendered).to have_content('Recipe 2 by User 2')
    expect(rendered).to have_content('0', count: 2)
  end

  it 'displays a Details link for each recipe' do
    render
    expect(rendered).to have_selector('a.btn', text: 'Details', count: 2)
  end
end
