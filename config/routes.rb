Rails.application.routes.draw do
  resources :choices
  resources :questions
  resources :sectors
  resources :budgets
  resources :clients
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root to: 'budgets#index'
end
