Rails.application.routes.draw do

  root 'static_pages#new'
  post '' => 'static_pages#form'

end
