require 'rails_helper'

RSpec.describe Recipe, type: :model do
  describe 'validations' do
    it 'is valid with a name' do
      recipe = Recipe.new(name: 'Test Recipe')
      expect(recipe).to be_valid
    end

    it 'is invalid without a name' do
      recipe = Recipe.new(name: nil)
      expect(recipe).to_not be_valid
    end
  end

  describe 'associations' do
    it { should belong_to(:user) }
    it { should have_many(:recipe_foods) }
  end
end
