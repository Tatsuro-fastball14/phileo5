Rails.application.routes.draw do
  # devise_for :users
  get 'places/index'
  get 'cooks/search'
  get '/api/place', to: 'places#place'
  
    resources :cooks, only: [:index, :create] do
    end
  root to: "places#index"
end

