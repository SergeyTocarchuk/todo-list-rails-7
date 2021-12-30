Rails.application.routes.draw do
  devise_for :users

  root 'pages#about'

  resources :users 
  resources :lists

  resources :items do
    member do
      get 'complete'
      get 'incomplete'
    end
  end
  
end
