# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  root 'static_pages#index'
  resources :courses, only: [:index, :show] do
    resources :enrollments, only: :create
  end
  resources :lessons, only: [:show]
  namespace :instructor do
    resources :sections, only: [] do
      resources :lessons, only: [:new, :create, :destroy]
    end
    resources :courses, only: [:new, :create, :show, :destroy] do
      resources :sections, only: [:new, :create, :destroy]
    end
  end
end
