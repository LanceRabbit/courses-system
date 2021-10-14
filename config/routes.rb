Rails.application.routes.draw do
  resources :sessions, only: [:new, :create, :destroy]
  get 'login', to: 'sessions#new', as: 'login'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  root "pages#home"

  namespace :admin do
    resources :courses, param: :slug
    root to: "courses#index"
  end
end
