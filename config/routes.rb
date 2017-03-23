Rails.application.routes.draw do
  devise_for :users
  root 'paragraphs#index'

  get '/admin', to: 'dashboard/offers#index'

  resources :members, only: [:index]
  resources :paragraphs, only: [:index], path: 'about'
  resources :offers, only: [:index]
  resources :details, only: [:index]
  resources :bookings, only: [:new, :create]

  namespace :dashboard do
    resources :members, except: [:show]
    resources :offers, except: [:show]
    resources :paragraphs, except: [:show]

    resources :booking_weeks, only: [:index]

    resources :bookings do
      resources :approvals, only: :create
    end
  end
end
