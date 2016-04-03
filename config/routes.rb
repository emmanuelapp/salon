Rails.application.routes.draw do
  root 'front/about_posts#index'

  namespace :front do
    resources :members
    resources :about_posts
    resources :offers
  end
end
