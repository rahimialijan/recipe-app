require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { User.create(name: 'Alijan', email: 'alijan@example.com', password: 'password') }
  let!(:food1) { user.foods.create(name: 'Pizza', price: 10.99) }
  let!(:food2) { user.foods.create(name: 'Burger', price: 5.99) }

  describe '#count_food_items' do
    it 'returns the correct count of associated food items' do
      expect(user.count_food_items).to eq(2)
    end
  end

  describe '#total_price' do
    it 'returns the correct total price of associated food items' do
      expect(user.total_price).to eq(16.98)
    end
  end
end
