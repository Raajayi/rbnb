Rails.application.routes.draw do
  devise_for :users
  root to: "bands#index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  resources :bookings, only: %i[index]

  resources :bands, except: :destroy do
    resources :availabilities
  end

end
