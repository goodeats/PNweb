Rails.application.routes.draw do
  root 'pat#index'

  get '/header_image.jpg', to: 'pat#image_url', as: :pat

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
    get 'signin', to: 'devise/sessions#new'
    get 'login', to: 'devise/sessions#new'
  end

  resources :about, only: [:index]
  resources :projects, only: [:index]
  resources :articles, path: 'blog', only: [:index, :show]
  resources :demos, only: [:index, :show]

  namespace :admin do
    resources :pat, only: [:index]
    resources :projects, :demos, :about
    resources :articles, path: 'blog'
  end

  namespace :api, constraints: { format: 'json' } do
    namespace :v1 do
      resources :yo, only: [:index, :show]
    end
  end

  get 'admin', to: 'admin/pat#index', as: :admin
end
