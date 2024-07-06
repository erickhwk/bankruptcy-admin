Rails.application.routes.draw do
  resources :companies
  resources :reports
  resources :lawsuits
  root 'pages#index'

  get 'team', to: 'pages#team'

  resources :tenancies
  devise_for :users

  get "up" => "rails/health#show", as: :rails_health_check

end
