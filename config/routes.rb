Rails.application.routes.draw do
  root 'homes#index'
  devise_for :users
    resources :restaurants, only: [:index, :show, :new, :create]

    namespace :api do
      namespace :v1 do
        resources :restaurants, only: [:create, :show, :search]
        post 'restaurants/search', to: 'restaurants#search'
      end
    end
end
