Rails.application.routes.draw do
  root 'front/paragraphs#index'

  namespace :front do
    resources :members
    resources :paragraphs
    resources :offers
  end

  namespace :dashboard do
  	resources :members
  	resources :offers
    resources :paragraphs
  end
end
