Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  resources :choices
  resources :questions
  resources :sectors
  resources :budgets
  resources :clients
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root to: 'budgets#index'
end
