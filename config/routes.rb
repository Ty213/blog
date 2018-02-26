Rails.application.routes.draw do
  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  root to: "sessions#new"

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  post '/logout', to: 'sessions#destroy'

  resources :users
  resources :posts do
    resources :comments
  end

end
