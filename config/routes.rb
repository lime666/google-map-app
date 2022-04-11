Rails.application.routes.draw do
  namespace :admin do
    resources :users
  end

  get 'admin', to: 'admin/users#index'
  #get '/admin/users/show', to: 'admin/users#show'
  #get '/admin/users/new', to: 'admin/users#new'
  delete 'delete_user', to: 'admin/users#destroy'

  # root "articles#index"
end
