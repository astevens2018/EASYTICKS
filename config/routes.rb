Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: "registrations", omniauth_callbacks: 'users/omniauth_callbacks' }
  root to: 'pages#home'

  resources :tickets do
    resources :payments, only: [:new, :create]
    resources :confirmation, only: [:show]
  end

  resource :requests, only: [:new, :create, :destroy, :show]
  resource :reports, only: [:create, :show]

  get "users/verify", to: 'users#show_verify', as: 'show_verify'
  post "users/verify", to: 'users#verify', as: 'verify'
  post "users/resend", to: 'users#verify', as: 'resend'

  get '/dashboard', to: 'users#dashboard', as: 'dashboard'
  get '/request', to: 'users#dashboard'
  resources :users do
    resources :dashboard, only: [:show, :edit, :update]
  end

  get '/validation', to: 'users#validation', as: 'validation'
  get 'tickets/:id/confirm', to: "tickets#confirmation", as: 'confirm'
  put 'tickets/:id/update', to: 'tickets#update', as: 'update'
  delete '/tickets/:id', to: "tickets#destroy", as: 'delete'
end

