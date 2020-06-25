Rails.application.routes.draw do
  get 'photograph_tags/new'
  get 'photograph_tags/create'
  get 'photograph_tags/destroy'
  devise_for :users
  root to: 'pages#home'
  get 'profile', to: 'pages#profile'
  resources :photographers do
    resources :bookings, only: [:new, :create, :show]
    resources :photographs, only: [:new, :create, :index, :show, :destroy] do
      resources :photograph_tags, only: [:new, :create, :destroy]
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
