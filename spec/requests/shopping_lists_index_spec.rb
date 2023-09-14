require 'rails_helper'

RSpec.describe 'Shopping Lists Index', type: :request do
  before do
    @total_missing_items = 5
    @total_missing_price = 25.0
    @missing_food_items = [
      { name: 'Food1', quantity: 2, price: 10.0 },
      { name: 'Food2', quantity: 3, price: 15.0 }
    ]
  end

  it 'displays the shopping list title' do
    render
    expect(rendered).to have_selector('h1', text: 'General Shopping List')
  end

  it 'displays the total amount of food to buy' do
    render
    expect(rendered).to have_selector('p', text: 'Amount of Food to Buy: 5')
  end

  it 'displays the total value of food needed' do
    render
    expect(rendered).to have_selector('p', text: 'Total Value of Food Needed: $25.00')
  end

  it 'displays the food items in the table' do
    render
    expect(rendered).to have_selector('table tbody tr', count: 2)
    expect(rendered).to have_content('Food1')
    expect(rendered).to have_content('Food2')
    expect(rendered).to have_content('2')
    expect(rendered).to have_content('3')
    expect(rendered).to have_content('$10.00')
    expect(rendered).to have_content('$15.00')
  end

  it 'displays a link to go back to recipes_path' do
    render
    expect(rendered).to have_link('Back', href: recipes_path)
  end
end
