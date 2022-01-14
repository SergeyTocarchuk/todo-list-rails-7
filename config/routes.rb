Rails.application.routes.draw do
  devise_for :admins, controllers: { sessions: 'admins/sessions', registrations: 'admins/registrations' }
  devise_for :users, controllers: { sessions: 'users/sessions', registrations: 'users/registrations' }

  root 'pages#about'
  
  namespace :admins do
    resources :admins, only: [:show]
    resources :lists do
      collection do
        get 'search'
      end
    end
    resources :users
  end

  namespace :search do
    get "list", to: "search_lists#search"
    get "show-list", to: "search_lists#show"
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