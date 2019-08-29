# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  root 'static_pages#index'
  resources :courses, only: %i[index show]
  namespace :instructor do
    resources :courses, only: %i[new create show] do
      resources :sections, only: %i[new create]
    end
  end
end
