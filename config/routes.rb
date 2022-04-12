Rails.application.routes.draw do

  namespace :admin do
    resources :users
    resources :locations

    root 'locations#dashboard'

  end


end
