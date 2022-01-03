Rails.application.routes.draw do
  devise_for :users

  root 'pages#about'
  get "search", to: "lists#search"

  resources :users 
  resources :lists
  resources :items do
    member do
      get 'complete'
      get 'incomplete'
    end
  end
end
