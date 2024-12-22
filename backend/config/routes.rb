Rails.application.routes.draw do
  devise_for :users
  root to: 'cooks#index'
 
  get 'places/index'
  get 'cooks/search'
  get '/api/place', to: 'places#place'
  get '/api/test', to: 'application#test'
  post  'cooks/new'
  post  'cooks/umarepos'
  
  resources :cooks, only: [:index, :new, :create, :show] do
    collection do
      get 'search' # /cooks/search へのGETリクエストを設定
    end
    resources :umarepos, only:[:new,:create]
  end
    resources :places, only: [:index, :create] do
    end
end
