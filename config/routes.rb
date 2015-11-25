Rails.application.routes.draw do

  # root "welcome#index"
  root "pat#index"
  resources :ouipig, only: [:index]
  resources :about, only: [:index]

end
