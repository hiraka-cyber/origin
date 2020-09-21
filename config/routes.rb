Rails.application.routes.draw do
  get 'welcome/index'
  root 'welcome#index'
  devise_for :users
  resources :users do
    member do
      get :following,:followers
    end
  end
  resources :users,only:[:index,:show]
  resources :relationships,only:[:create,:destroy]
  resources :message,only: [:create]
  resources :rooms,only: [:create,:show,:index]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
