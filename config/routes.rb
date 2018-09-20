Rails.application.routes.draw do

  root 'static_pages#home'

  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

  get  '/about',   to: 'static_pages#about'
  get  '/signup',  to: 'users#new'

  resources :tasks
  resources :users do
    resources :tasks
  end

  resources :projects do
    resources :tasks
  end
end
