 Rails.application.routes.draw do
  devise_for :admins, controllers: { sessions: 'admins/sessions'}
  devise_for :employees, controllers: { sessions: 'employees/sessions'}
  devise_for :coaches, controllers: { sessions: 'coaches/sessions'}

  # root to: redirect('/admin')
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  namespace :rails_admin do
    resources :company, only: [] do
      get 'employees', on: :member
    end
  end

  namespace :coaches do
    root to: 'dashboard#index'
  end
  
  namespace :employees do
    root to: 'employees#index'
  end

  #without auth
  resources :companies, only: [:show] do
    post 'register_user', on: :member
  end
end
