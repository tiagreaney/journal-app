Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root to: 'main#index'
  resources :entries, only: [:create, :new, :destroy]

  get "sign_up", to: "registrations#new"
  post "sign_up", to: "registrations#create"

  get "sign_in", to: "sessions#new"
  post "sign_in", to: "sessions#create"

  get "entries", to: "entries#index"
  post "entries", to: "entries#create"

  get "new_entries", to: "entries#new"
  post "new_entries", to: "entries#create"

  delete "logout", to: "sessions#destroy"
end
