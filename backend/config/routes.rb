Rails.application.routes.draw do
  devise_for :users
  # devise_for :users
  get 'places/index'
  get 'cooks/search'
  get '/api/place', to: 'places#place'
  get '/api/test', to: 'application#test'
  post  'cooks/new'
  
  devise_for :users

  resources :cooks, only: [:index, :new, :create, :show] do
    collection do
      get 'search' # /cooks/search へのGETリクエストを設定
    end
  end
    resources :places, only: [:index, :create] do
    end
   
end
