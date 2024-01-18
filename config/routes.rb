Rails.application.routes.draw do
  resources :testpages
  get 'home/index'
  resources :users

  root "articles#index"
  get "/articles", to: "articles#index"


  


  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
