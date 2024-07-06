Rails.application.routes.draw do
  resources :reports
  resources :lawsuits
  root 'pages#index'
  
  resources :tenancies
  devise_for :users

  get "up" => "rails/health#show", as: :rails_health_check

end
