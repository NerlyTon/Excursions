Rails.application.routes.draw do
  
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  get 'welcome', to: 'sessions#welcome'
  delete 'logout', to: 'sessions#destroy'
  resources :excursions do
      resources :bookings
  end

  resources :users 
  resources :bookings



  

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
