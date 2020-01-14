Rails.application.routes.draw do
  resources :invoices
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  
  devise_for :users, controllers: {registrations: 'registrations'}
  resources :clients
  resources :budgets do
    get 'email', on: :member
  end
  resources :line_items
  resource :profile, only: %w[edit update]

  root to: 'clients#index'
end
