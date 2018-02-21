Rails.application.routes.draw do
  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  root to: "users#index"

  resources :users
  resources :blogs

end
