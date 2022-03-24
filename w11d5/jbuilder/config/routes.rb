Rails.application.routes.draw do

  namespace :api, defaults: { format: :json } do
    resources :guests do
      resources :gifts, only: [:index]
    end
    resources :gifts, only: [:show]
    resources :parties
  end
  # root to: 'static_pages#root'
end
