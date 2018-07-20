Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users
  root 'landing#index'
  get '/welcome', to: 'landing#index'
  get '/login', to: 'landing#login'
  post '/login', to: 'landing#authenticate'
  post '/logout', to: 'landing#logout'
  post '/vote', to: 'votes#create'
  post '/users/me', to: 'users#profile'
  resources :posts
  resources :comments
end
