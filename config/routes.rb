Rails.application.routes.draw do
  root :to => 'home#index'
  resources :foods
  resources :exercises
end
