Rails.application.routes.draw do
  devise_for :users

  # devise_for :users, controllers: { sessions: "sessions", registrations: "registrations", passwords: "passwords", confirmations: "confirmations" }
  resources :companies

  resources :users do
  	post :save_user, on: :collection
  	post :update_user, on: :member
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: "companies#index"
end
