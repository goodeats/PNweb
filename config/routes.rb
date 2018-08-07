Rails.application.routes.draw do
  root 'pat#index'

  # https://collectiveidea.com/blog/archives/2016/01/12/lets-encrypt-with-a-rails-app-on-heroku
  # not free with heroku anymore 🤷🏻‍♂️
  get '/.well-known/acme-challenge/:id' => 'pat#letsencrypt'

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
    resources :pat, only: [:index]
    resources :projects
  end

  get 'admin', to: 'admin/pat#index', as: :admin
end
