class FoodsController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource

  def index
    @foods = current_user.foods.includes(:recipe_foods)
  end

  def new
    @food = Food.new
  end

  def create
    @food = current_user.foods.build(food_params)
    if @food.save
      redirect_to foods_path, notice: 'Food added successfully.'
    else
      render :new
    end
  end

  def destroy
    @food = Food.find(params[:id])
    @food.recipe_foods.destroy_all
    @food.destroy
    redirect_to foods_path, notice: 'Food deleted successfully.'
  end

  private

  def set_food
    @food = current_user.foods.find(params[:id])
  end

  def food_params
    params.require(:food).permit(:name, :measurement_unit, :price, :quantity)
  end
end
