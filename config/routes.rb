# frozen_string_literal: true

Rails.application.routes.draw do
  # devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace 'api' do
    namespace 'v1' do
      resources :articles
      resources :sessions, only: %i[create]
      resources :accounts, only: %i[create update show]
    end
  end

  get '/*a', to: 'application#not_found'
end
