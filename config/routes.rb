Rails.application.routes.draw do
  # get 'areas/index'
  devise_for :users
  root to: 'areas#index'
  resources :area
end
