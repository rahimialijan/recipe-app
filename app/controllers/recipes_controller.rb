class RecipesController < ApplicationController
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

  def edit
    @recipe = Recipe.find(params[:id])
  end

  def show
    @recipe = Recipe.find(params[:id])
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
