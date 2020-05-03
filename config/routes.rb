Rails.application.routes.draw do
  get '/login', to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"

  namespace :admin do
    resources :users
  end
  
  get "sources/top", to: "sources#top"
  root to: "sources#top"
  resources :sources
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
