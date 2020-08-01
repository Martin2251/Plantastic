Rails.application.routes.draw do
  devise_for :users

  resources :plants do
    resources :reviews, only: [ :new, :create ]
    resources :bookings
  end
end
