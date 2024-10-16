Rails.application.routes.draw do
  # devise_for :users
  get 'places/index'
  get 'cooks/search'
  get '/api/place', to: 'places#place'
  
    resources :places, only: [:index, :create] do
    end
end

