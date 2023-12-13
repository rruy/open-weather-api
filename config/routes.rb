Rails.application.routes.draw do
  namespace :api do
    resources :weather, only: [:index, :create]
  end
end
