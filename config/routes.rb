Rails.application.routes.draw do

  root "welcome#index"
  resources :ouipig, only: [:index]
  resources :about, only: [:index]

end
