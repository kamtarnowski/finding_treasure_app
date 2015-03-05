Rails.application.routes.draw do

  resources :user_forms, only: [:new, :create]
  root 'user_forms#new'

end
