Rails.application.routes.draw do
  root 'about_posts#index'
  resources :about_posts
  resources :offers
end
