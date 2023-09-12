Rails.application.routes.draw do
  devise_for :users, skip: [:sessions]
  as :user do
    get 'login' => 'devise/sessions#new', as: :new_user_session
    post 'login' => 'devise/sessions#create', as: :user_session
    get 'logout' => 'devise/sessions#destroy', as: :destroy_user_session
  end

devise_scope :user do
  root "home#index"
  resources :users, only: [:index]
end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
    resources :foods, only: [:index, :new, :create]

  # Defines the root path route ("/")
  # root "articles#index"

end
