Rails.application.routes.draw do
  devise_for :users
  
  root "events#index"

  resources :users
  resources :events, only: [:create, :destroy]
  resources :acquisitions, only: [:create, :destroy]
  resources :level_sets, only: :create

end
