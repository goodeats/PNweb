Rails.application.routes.draw do
  root 'pat#index'

  devise_for :users, controllers: {
    confirmations: 'users/confirmations',
    # omniauth_callbacks: 'users/omniauth_callbacks',
    passwords: 'users/passwords',
    registrations: 'users/registrations',
    sessions: 'users/sessions',
    unlocks: 'users/unlocks',
  }

  devise_scope :user do
    get 'login', to: 'devise/sessions#new'
  end

  resources :about, only: [:index]
  resources :projects, only: [:index]
  resources :articles, path: 'blog', only: [:index]

  namespace :admin do
    resources :pat
  end

  get 'admin', to: 'admin/pat#index', as: :admin
end
