Rails.application.routes.draw do
  devise_for :users
  root 'flats#index'
  resources :flats
end
