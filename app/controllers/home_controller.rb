class HomeController < ApplicationController
  before_action :authenticate_user!

  def index
    @users = User.includes(:foods, :recipes).all.order(id: :asc)
    authorize! :read, Recipe
  end
end
