Rails.application.routes.draw do
  devise_for :users

  root 'pages#about'

  namespace :admins do
    get 'admin', to: 'dashboard#index'
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
