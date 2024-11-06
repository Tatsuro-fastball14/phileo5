Rails.application.routes.draw do
  # devise_for :users
  get 'places/index'
  get 'cooks/search'
  get '/api/place', to: 'places#place'
  get '/api/test', to: 'application#test'
  post  'cooks/new'

  resources :cooks, only: [:index] do
    collection do
      get 'search' # /cooks/search へのGETリクエストを設定
    end
  end
    resources :places, only: [:index, :create] do
    end
   
end
