Rails.application.routes.draw do

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :events
  resources :availabilities

  get 'reformat_time', to: 'application#reformat_time'

  root 'events#index'
end
