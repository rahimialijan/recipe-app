class ShoppingListsController < ApplicationController
  def index
    # Retrieve the logged-in user
    @user = current_user

    # Fetch all recipes of the logged-in user
    @recipes = @user.recipes

    # Initialize an empty list to store missing food items
    @missing_food_items = []

    # Calculate the total food items and total price of the missing food
    @total_missing_items = @missing_food_items.count
    @total_missing_price = @missing_food_items.sum(&:price)
  end
end
