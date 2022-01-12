Rails.application.routes.draw do
  devise_for :admins, controllers: { sessions: 'admins/sessions', registrations: 'admins/registrations' }
  devise_for :users, controllers: { sessions: 'users/sessions', registrations: 'users/registrations' }

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
