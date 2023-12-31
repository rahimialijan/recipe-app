class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # Guest user (not logged in)

    can :read, Recipe
    can :create, Recipe
    can :update, Recipe, user_id: user.id
    can :destroy, Recipe, user_id: user.id
    can :toggle_public, Recipe, user_id: user.id
    can :public_recipes, Recipe, user_id: user.id
    can :read, Food, user_id: user.id
    can :create, Food, user_id: user.id
    can :destroy, Food, user_id: user.id
  end
end
