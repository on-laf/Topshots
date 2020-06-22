Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :photographers do
    resources :bookings, only: [:create, :new, :show]
    resources :photos, only: [:create, :new, :show, :destroy]
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
