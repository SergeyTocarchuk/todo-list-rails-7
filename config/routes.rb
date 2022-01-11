Rails.application.routes.draw do
  devise_for :admins
  devise_for :users

  root 'pages#about'
  get "search", to: "lists#search"

  resources :users 
  resources :lists do
    resources :items do
      member do
        get 'complete'
        get 'incomplete'
      end
    end
  end
end
