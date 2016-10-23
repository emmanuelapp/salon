Rails.application.routes.draw do
  devise_for :users
  root 'front/paragraphs#index'

  get '/admin', to: 'dashboard/offers#index'

  namespace :front do
    resources :members, only: [:index]
    resources :paragraphs, only: [:index], path: 'about'
    resources :offers, only: [:index]
    resources :details, only: [:index]
    resources :bookings, only: [:new, :create]
  end

  namespace :dashboard do
    resources :members, except: [:show]
    resources :offers, except: [:show]
    resources :paragraphs, except: [:show]
  end
end
