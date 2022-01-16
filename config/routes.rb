Rails.application.routes.draw do
  devise_for :admins, controllers: { sessions: 'admins/sessions', registrations: 'admins/registrations' }
  devise_for :users, controllers: { sessions: 'users/sessions', registrations: 'users/registrations' }

  root 'pages#about'
  
  namespace :admins do
    resources :admins, only: [:show]
    resources :lists do
      collection do
        get 'search'
        get 'search_show'
      end
      resources :items do
        member do
          get 'complete'
          get 'incomplete'
        end
        collection do
          get 'search'
          get 'search_show'
        end
      end
    end
    resources :users
  end

  namespace :users do
    resources :lists do
      resources :items do
        member do
          get 'complete'
          get 'incomplete'
        end
        collection do
          get 'search'
          get 'search_show'
        end
      end
      collection do
        get 'search'
        get 'search_show'
      end
    end
  end
end