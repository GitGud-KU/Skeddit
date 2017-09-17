Rails.application.routes.draw do
  get 'availabilities/new'

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :events

  root 'events#index'
end
