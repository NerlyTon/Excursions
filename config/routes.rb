Rails.application.routes.draw do
  
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  get 'welcome', to: 'sessions#welcome'
  resources :users
  resources :excursions
  resources :bookings

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
