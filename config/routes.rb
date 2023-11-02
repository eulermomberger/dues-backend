Rails.application.routes.draw do
  resources :dues, only: [:index, :create, :show, :update]
end
