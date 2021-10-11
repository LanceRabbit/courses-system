Rails.application.routes.draw do
  namespace :admin do
    resources :courses, only: %i[index show new create], param: :slug
  end
end
