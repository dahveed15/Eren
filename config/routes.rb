Rails.application.routes.draw do
  # get 'dashboards/show'

  root to: 'home#show'
  resource :machines, only: [:new, :create]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
