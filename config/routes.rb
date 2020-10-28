Rails.application.routes.draw do
  # get 'spots/index'
  devise_for :users
  root to: 'spots#index'
  resources :users, only: :show
  resources :spots do
    resources :comments, only: :create
  end
end
