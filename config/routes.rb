Rails.application.routes.draw do

  resources :sessions, only: [:new, :create, :destroy]
  resources :testpages
  get 'home/index'
  resources :users
  root to: 'home#index'

  #get "/articles", to: "articles#index"
  #注册
  get  '/signin', to: 'users#new'
  post '/signin', to: 'users#create'
  #登陆
  get  'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  #登出
  delete '/logout',  to: 'sessions#destroy'


  


  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
