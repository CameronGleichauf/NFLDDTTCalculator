Rails.application.routes.draw do
  post '/trades/save_trade', to: 'trades#save_trade'
  delete 'teams/:id/clear_trades', to: 'teams#clear_trades', as: 'clear_trades'
  resources :trades, only: [:index, :new, :create, :show] do
    post 'save_trade', on: :collection # Custom route for saving trade
  end

  resources :picks, only: [:index, :show]

  resources :teams, only: [:index, :show] do
    resources :picks, only: [:index], on: :collection # Nested picks route for teams
    delete 'clear_trades', on: :member # Custom route to clear trades for a team
  end

  get 'home/index'

  get "up" => "rails/health#show", as: :rails_health_check

  root "home#index"
end
