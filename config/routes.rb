Rails.application.routes.draw do
  devise_for :users,
  controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  root to: 'pages#home'

  resources :tickets do
    resources :payments, only: [:new, :create]
    resources :confirmation, only: [:show]
  end
  resource :requests, only: [:create, :destroy]
  resource :reports, only: [:create, :show]

  get '/dashboard', to: 'users#dashboard', as: 'dashboard'
  resources :users do
  resources :dashboard, only: [:show, :edit, :update]
  end

  get 'tickets/:id/confirm', to: "tickets#confirmation", as: 'confirm'
  put 'tickets/:id/update', to: 'tickets#update', as: 'update'

end

