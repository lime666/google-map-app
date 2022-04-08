Rails.application.routes.draw do
  namespace :admin do
    resources :users
  end

  get 'admin', to: 'admin/users#index'
  get '/admin/users/show', to: 'admin/users#show', as: 'user'
  get '/admin/users/new', to: 'admin/users#new', as: 'new_user_path'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
