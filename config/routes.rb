Rails.application.routes.draw do
  resources :locations
  resources :contacts
  resources :entity_infos
  resources :user_roles
  resources :permissions_roles
  resources :permissions
  resources :roles
  # resources :users
  get "dashboard/index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  # Defines the root path route ("/")
  root "dashboard#index"

  get '/users', to: 'users#index', as: :users
  get '/users/new', to: 'users#new', as: :new_user
  post '/users', to: 'users#create', as: :create_user
  get '/users/:id/edit', to: 'users#edit', as: :edit_user
  patch '/users/:id', to: 'users#update', as: :update_user
  get '/users/:id/view', to: 'users#show', as: :show_user
  delete '/users/:id/delete', to: 'users#delete', as: :delete_user
  delete '/users/delete_multiple', to: 'users#delete_multiple', as: :delete_multiple_users
  put '/users/:id/update-status', to: 'users#toggle_status', as: :toggle_status_user
end
