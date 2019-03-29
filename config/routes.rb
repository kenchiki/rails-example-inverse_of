Rails.application.routes.draw do
  root 'blogs#index'
  resources :blogs
  resources :articles, only: %i[new create]
end
