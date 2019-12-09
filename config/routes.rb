Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  devise_for :users
  
  resources :budgets
  resources :choices
  resources :questions
  resources :sectors
  resources :clients

  root to: 'clients#index'
end
