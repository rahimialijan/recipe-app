Rails.application.routes.draw do
  devise_for :users, skip: [:sessions]
  as :user do
    get 'login' => 'devise/sessions#new', as: :new_user_session
    post 'login' => 'devise/sessions#create', as: :user_session
    get 'logout' => 'devise/sessions#destroy', as: :destroy_user_session
  end
  root "home#index"
  resources :users, only: [:index, :show, :destroy]
  resources :foods, only: [:new, :create, :index, :destroy]
  resources :recipes, only: [:index, :show, :new, :create, :edit, :destroy] do
    member do
      patch :toggle_public
    end
    resources :recipe_foods, only: [:new, :create, :edit, :update, :destroy]
  end
  resources :public_recipes, only: [:index]
  resources :shopping_lists, only: [:index]
  post 'shopping_lists/:recipe_id/generate', to: 'shopping_lists#generate', as: :generate_shopping_list
end
