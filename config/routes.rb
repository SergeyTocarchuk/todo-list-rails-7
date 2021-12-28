Rails.application.routes.draw do
  devise_for :users

  root 'pages#about'

  resources :users

    resources :items do
      member do
        get 'complete'
      end
    end
    
end
