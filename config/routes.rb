Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"

  resources :pet_profiles
  resources :user_profiles, except: [:destroy]

  resources :appointments do
    get :accept, on: :member
    get :reject, on: :member
  end

  resources :categories, only: [:show, :index], path: 'forum'
  resources :posts, only: [:show, :new, :create, :destroy] do
    resources :replies, only: [:create, :destroy]
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  get '/dashboard', to: 'users#dashboard', as: 'dashboard'

  # Defines the root path route ("/")
  # root "articles#index"
end
