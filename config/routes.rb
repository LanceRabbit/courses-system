Rails.application.routes.draw do
  namespace :admin do
    resources :courses, only: :index
  end
end
