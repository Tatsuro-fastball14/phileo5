Rails.application.routes.draw do
  # devise_for :users
  get 'places/index'
  get 'cooks/search'
  get '/api/place', to: 'places#place'
  
   devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  root to: "places#index"
end

