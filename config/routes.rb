Rails.application.routes.draw do
  devise_for :users
  root 'pat#index'

  resources :about, only: [:index]
  resources :projects, only: [:index]
  resources :articles, path: 'blog', only: [:index]
end
