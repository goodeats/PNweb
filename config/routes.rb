Rails.application.routes.draw do
  root 'pat#index'

  resources :about, only: [:index]
  resources :projects, only: [:index]
  resources :articles, only: [:index]
end
