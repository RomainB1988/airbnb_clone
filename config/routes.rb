Rails.application.routes.draw do
  get 'pages/home'
  devise_for :users
  root 'pages#home'
  resources :flats do
    resources :reservations, only: [:create]
    resources :comments, only: [:create]
  end
end
