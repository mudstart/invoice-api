# frozen_literal_string: true

Rails.application.routes.draw do
  devise_for :users
  namespace :v1, defaults: { format: :json } do
    resources :contacts
    resources :accounts, only: [:create, :update]
    resource :sessions, only: [:create, :destroy, :show]
    resources :users, only: [:create]
  end
end
