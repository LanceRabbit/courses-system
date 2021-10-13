Rails.application.routes.draw do
  namespace :admin do
    resources :courses, param: :slug
  end
end
