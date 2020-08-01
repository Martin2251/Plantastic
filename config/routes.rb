Rails.application.routes.draw do
  devise_for :users
  resources :plants
end
