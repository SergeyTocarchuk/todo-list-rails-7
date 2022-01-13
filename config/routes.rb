Rails.application.routes.draw do
  devise_for :admins, controllers: { sessions: 'admins/sessions', registrations: 'admins/registrations' }
  devise_for :users, controllers: { sessions: 'users/sessions', registrations: 'users/registrations' }

  root 'pages#about'
  get "search", to: "lists#search"

  resources :admins, only: [:show] 
  get 'admin', to: 'admins#show'
  get 'all-lists', to: 'lists#administration'
  get 'all-users', to: 'users#index'

  namespace :admin do
    resources :lists
  end

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
