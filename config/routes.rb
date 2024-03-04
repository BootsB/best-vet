Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"

  scope '/forum' do
    resources :posts, path: '' do
      resources :replies, path: 'comments'
    end
  end

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
