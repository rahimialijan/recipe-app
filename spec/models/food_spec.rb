require 'rails_helper'

RSpec.describe Food, type: :model do
  describe 'validations' do
    it 'is valid with a name' do
      food = Food.new(name: 'Test Food')
      expect(food).to be_valid
    end

    it 'is invalid without a name' do
      food = Food.new(name: nil)
      expect(food).to_not be_valid
    end
  end

  describe 'associations' do
    it { should belong_to(:user) }
    it { should have_many(:recipe_foods) }
  end
end
