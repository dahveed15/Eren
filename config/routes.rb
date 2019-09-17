Rails.application.routes.draw do
  # get 'dashboards/show'

  root to: 'home#show'
  resources :machines, only: [:new, :create] do
    resources :exercises, only: [:new, :create]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
