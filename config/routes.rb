Rails.application.routes.draw do
  root 'front/paragraphs#index'

  namespace :front do
    resources :members, only: [:index]
    resources :paragraphs, only: [:index]
    resources :offers, only: [:index]
  end

  namespace :dashboard do
  	resources :members
  	resources :offers
    resources :paragraphs
  end
end
