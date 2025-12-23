Rails.application.routes.draw do
  devise_for :users
  
  # Root route
  root "pages#home"
  
  # Public routes
  resources :vehicles, only: [:index, :show]
  resources :locations, only: [:index, :show]
  
  # Authenticated user routes
  resources :bookings
  
  get "up" => "rails/health#show", as: :rails_health_check
end
