Rails.application.routes.draw do
  get 'trades/index'
  get 'trades/new'
  get 'trades/create'
  get 'trades/show'
  get 'picks/index'
  get 'picks/show'

  resources :teams, only: [:index, :show] do
    resources :picks, only: [:index]
  end
  resources :trades, only: [:index, :new, :create, :show]

  get 'home/index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  root "home#index"

  get "/teams", to: "teams#index"
  get "/teams/:id", to: "teams#show"

  post '/trades/save_trade', to: 'trades#save_trade'
end
