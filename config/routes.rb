Rails.application.routes.draw do
  resources :line_items
  resources :budget_types
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  devise_for :users
  
  resources :budgets
  resources :choices
  resources :questions
  resources :budget_types
  resources :clients

  root to: 'clients#index'
end
