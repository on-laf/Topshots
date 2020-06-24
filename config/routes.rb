Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get 'profile', to: 'pages#profile'
  resources :photographers do
    resources :bookings, only: [:create, :new, :show]
    resources :photographs, only: [:create, :new, :index, :show, :destroy]
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
