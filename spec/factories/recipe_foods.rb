# In your FactoryBot configuration (e.g., spec/factories/recipe_foods.rb)
FactoryBot.define do
  factory :recipe_food do
    quantity { 1 }
    # Add other attributes as needed
    association :recipe, factory: :recipe
    association :food, factory: :food
  end
end
