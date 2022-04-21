Rails.application.routes.draw do
  

  namespace :admin do
    devise_for :users
    resources :users
    resources :locations



    root 'locations#dashboard'

  end


end
