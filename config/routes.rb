Rails.application.routes.draw do
  root 'homes#index'
  devise_for :users
    resources :restaurants, only: [:index, :show, :new, :create]
    
    namespace :api do
      namespace :v1 do
        resources :restaurants, only: [:create, :show, :search]
          post 'restaurants/search', to: 'restaurants#search'
        resources :movies, only: [:create, :show, :search]
          post 'movies/search', to: 'movies#search'
      end
    end
end
