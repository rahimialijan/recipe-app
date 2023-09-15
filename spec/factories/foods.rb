# spec/factories/foods.rb

FactoryBot.define do
  factory :food do
    name { 'Pizza' }
    measurement_unit { 'Slice' }
    price { 10 }
    # Add any other attributes you need for your Food model
  end
end
