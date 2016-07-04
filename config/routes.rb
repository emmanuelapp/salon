Rails.application.routes.draw do
  root 'front/paragraphs#index'

  namespace :front do
    resources :members, only: [:index]
    resources :paragraphs, only: [:index]
    resources :offers, only: [:index]
  end

  namespace :dashboard do
    resources :members, only: [:index, :new, :create, :edit, :update]
    resources :offers, only: [:index, :new, :create, :edit, :update]
    resources :paragraphs, only: [:index, :new, :create, :edit, :update]
  end
end
