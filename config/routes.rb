Rails.application.routes.draw do
  devise_for :users

  resources :plants do
    resources :bookings, only:[ :create ]
  end

  resources :bookings, except: [ :create ] do
    resources :reviews, only: [ :new, :create ]
  end

  resources :reviews, only: [ :destroy ]

end
