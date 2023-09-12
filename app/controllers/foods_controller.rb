class FoodsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_food, only: [:show, :edit, :update, :destroy]

   def index
    @foods = current_user.foods
    @foods = Food.all
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
