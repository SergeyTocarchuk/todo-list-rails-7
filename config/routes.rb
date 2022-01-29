Rails.application.routes.draw do
  devise_for :users

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
      member do
        get 'find_user_to_share_with'
        post 'share_list'
      end
    end
  end
end
