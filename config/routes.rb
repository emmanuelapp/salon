Rails.application.routes.draw do
  devise_for :users
  root 'paragraphs#index'

  get '/admin', to: 'dashboard/offers#index'

  resources :paragraphs, only: [:index], path: 'about'
  resources :members,    only: [:index]
  resources :details,    only: [:index]
  resources :offers,     only: [:index]

  resources :bookings,   only: %i[new index]

  namespace :dashboard do
    resources :members,    except: [:show]
    resources :offers,     except: [:show]
    resources :paragraphs, except: [:show]

    resources :bookings do
      resources :approvals, only: :create
    end

    resources :bookings, param: :year do
      resources :weeks, param: :week_number, controller: 'bookings/weeks'
    end
  end

  namespace :api do
    namespace :v1 do
      resources :offers, only: [:index]
      resources :bookings, only: [:create]
      resources :reservation_dates, only: [:index]
    end
  end
end
