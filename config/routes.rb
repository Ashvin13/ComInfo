Rails.application.routes.draw do
  devise_for :users

  # devise_for :users, controllers: {
  #   sessions: 'users/sessions',
  #   # registrations: 'users/registrations',
  #   # passwords: 'users/passwords',
  #   # omniauth_callbacks: 'users/omniauth_callbacks'
  # }
  # devise_for :users, controllers: { sessions: "sessions", registrations: "registrations", passwords: "passwords", confirmations: "confirmations" }
  resources :companies do
    get :contact, :on => :collection
    post :contact, :on => :collection
    get :about, :on => :collection
    get :gallery, :on => :collection
  end

  resources :users do
  	post :save_user, on: :collection
  	post :update_user, on: :member
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: "companies#index"
end
