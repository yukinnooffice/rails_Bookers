Rails.application.routes.draw do

  devise_for :users
  resources :users
  resources :books

  root to: "homes#index"

  get 'home/about' => 'homes#about' , as: 'about'
end
