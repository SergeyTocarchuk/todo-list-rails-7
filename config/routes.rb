Rails.application.routes.draw do
  resources :items do
    member do
      get 'complete', 'incomplete'
    end
  end

end
