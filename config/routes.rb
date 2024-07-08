Rails.application.routes.draw do
  resources :companies
  resources :reports do
    member do
      delete :remove_file
    end
  end

  resources :lawsuits
  root 'pages#index'

  get 'team', to: 'pages#team'

  resources :tenancies
  
  devise_for :users, :controllers => { registrations: 'users/registrations' }


  get "up" => "rails/health#show", as: :rails_health_check

end
