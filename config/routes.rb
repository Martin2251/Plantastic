Rails.application.routes.draw do
  devise_for :users

  resources :plants do
    resources :bookings, only: [ :new, :create ]
  end

  resources :bookings, except: [ :new, :create ] do
    resources :reviews, only: [ :new, :create ]
  end

  resources :reviews, only: [ :destroy ]

  root to: 'plants#home'
end
