Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'registrations' }
  root to: 'pages#home'

  resources :tickets
  resource :requests, only: [:create, :destroy]
  resource :reports, only: [:create, :show]

  get '/dashboard', to: 'users#dashboard'

end

