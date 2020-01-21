Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users, controllers: {registrations: 'registrations'}

  resource :dashboard, only: :show
  resources :clients
  resources :budgets do
    get 'email',    on: :member
    resources :budget_convertors, only: [:new, :create]
  end
  resources :invoices do
    get 'email', on: :member
  end
  resources :line_items
  resource :profile, only: %w[edit update]

  root to: 'clients#index'
end
