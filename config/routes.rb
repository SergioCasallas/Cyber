Rails.application.routes.draw do
  root "homes#index"

  namespace :api do
    namespace :v1 do
      resources :battles, only: [:create]
    end
  end
end
