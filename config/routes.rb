Rails.application.routes.draw do
  resources :locations
  resources :users

  namespace :admin do
    resources :users

  end

  get 'admin', to: 'admin/users#index'
  get 'dashboard', to: 'locations#dashboard'
  #get '/admin/users/show', to: 'admin/users#show'
  #get '/admin/users/new', to: 'admin/users#new'
  delete 'delete_user', to: 'admin/users#destroy'

  # root "articles#index"
end
