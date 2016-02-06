Rails.application.routes.draw do
  root 'outlooks#index'
  resources :outlooks
  resources :offers
end
