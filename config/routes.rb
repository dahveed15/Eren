Rails.application.routes.draw do
  devise_for :users
  # get 'dashboards/show'

  root to: 'home#show'
  resources :activities, only: [:new, :create, :show, :edit, :update] do
    resources :exercises, only: [:new, :create]
  end

  get '/options', :to => 'options#show'
  post 'activities/:id/archive', :to => 'activities#archive', as: 'archive_activity'
  get 'archived_activities', :to => 'activities#archived_activities', as: 'archived_activities'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
