Rails.application.routes.draw do
  devise_for :admins, controllers: { sessions: 'admins/sessions', registrations: 'admins/registrations' }
  devise_for :users, controllers: { sessions: 'users/sessions', registrations: 'users/registrations' }

  root 'pages#about'
  
  get "search-list", to: "search_lists#search"
  get "show-search-list", to: "search_lists#show"

  namespace :admins do
    resources :admins, only: [:show]
    resources :lists
    resources :users
  end

  resources :lists do
    resources :items do
      member do
        get 'complete'
        get 'incomplete'
      end
    end
  end
end