Rails.application.routes.draw do
  resources :items do
    member do
      get 'complete'
      get 'uncomplete'
    end
  end

end
