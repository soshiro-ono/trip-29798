Rails.application.routes.draw do
  devise_for :users
  root to: 'spots#index'
  resources :users, only: :show
  resources :spots do
    resources :comments, only: :create
    collection do
      get 'search'
    end
  end
end
