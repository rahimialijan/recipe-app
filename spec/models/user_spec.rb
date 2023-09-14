require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    it 'is valid with a name' do
      user = User.new(name: 'Test User', email: 'test@example.com', password: 'password123')
      expect(user).to be_valid
    end

    it 'is invalid without a name' do
      user = User.new(name: nil, email: 'test@example.com', password: 'password123')
      expect(user).to_not be_valid
    end   
  end

  describe 'associations' do
    it { should have_many(:recipes) }
    it { should have_many(:foods) }
  end

  describe 'methods' do
    let(:user) { User.create(name: 'Test User', email: 'test@example.com', password: 'password123') }

    it 'counts food items' do
      food1 = user.foods.create(name: 'Food1', price: 10.0)
      food2 = user.foods.create(name: 'Food2', price: 15.0)

      expect(user.count_food_items).to eq(2)
    end

    it 'calculates the total price of food items' do
      food1 = user.foods.create(name: 'Food1', price: 10.0)
      food2 = user.foods.create(name: 'Food2', price: 15.0)

      expect(user.total_price).to eq(25.0)
    end
  end
end
