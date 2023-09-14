class RecipesController < ApplicationController
  load_and_authorize_resource
  before_action :authenticate_user!
  def new
    @recipe = Recipe.new
    @users = User.all
  end

  def create
    @recipe = current_user.recipes.build(recipe_params)
    if @recipe.save
      flash[:notice] = 'Recipe saved successfully'
    else
      flash[:alert] = 'Recipe failed to save'
    end
    redirect_to recipes_path
  end

  def index
    @recipes = current_user.recipes.all
  end

  def generate_shopping_list
    @recipe = Recipe.find(params[:id])
    @missing_food_items = @recipe.missing_food_items(current_user.foods)
    @total_missing_price = @missing_food_items.sum(&:price)
  end

  def show
    @recipe = Recipe.find(params[:id])
    @user = current_user    
  end

  def destroy
    @recipe = Recipe.find(params[:id])
    if @recipe.user == current_user
      @recipe.destroy
      redirect_to recipes_path, notice: 'Recipe was successfully deleted.'
    else
      redirect_to recipes_path, alert: 'You are not authorized to delete this recipe.'
    end
  endclass RecipesController < ApplicationController
  load_and_authorize_resource
  before_action :authenticate_user!
  def new
    @recipe = Recipe.new
    @users = User.all
  end

  def create
    @recipe = current_user.recipes.build(recipe_params)
    if @recipe.save
      flash[:notice] = 'Recipe saved successfully'
    else
      flash[:alert] = 'Recipe failed to save'
    end
    redirect_to recipes_path
  end

  def index
    @recipes = current_user.recipes.all
  end

  def show
    @recipe = Recipe.find(params[:id])
    @user = current_user
    @recipe_foods = @recipe.recipe_foods
  end

  def destroy
    @recipe = Recipe.find(params[:id])
    if @recipe.user == current_user
      @recipe.destroy
      redirect_to recipes_path, notice: 'Recipe was successfully deleted.'
    else
      redirect_to recipes_path, alert: 'You are not authorized to delete this recipe.'
    end
  end

  def toggle_public
    @recipe = Recipe.find(params[:id])
    @recipe.update(public: !@recipe.public)
    redirect_to @recipe
  end



  private

  def recipe_params
    params.require(:recipe).permit(
      :name,
      :preparation_time,
      :cooking_time,
      :description,
      :public,
      :user_id
    )
  end
end
