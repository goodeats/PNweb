Rails.application.routes.draw do

  root "welcome#index"
  resources :ouipig, only: [:index]

end
