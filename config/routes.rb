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
  resources :recipes, only: [:index, :show, :new, :create, :edit, :destroy]

end
