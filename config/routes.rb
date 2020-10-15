Rails.application.routes.draw do
  
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  get '/auth/:google_oauth2/callback' => 'sessions#google'
  get '/all_inclusive', to: 'excursions#all_inclusive'
  resources :excursions do
      resources :bookings
  end

  resources :users 
  resources :bookings


root 'excursions#index'
  

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
