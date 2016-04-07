Rails.application.routes.draw do
  mount ShopifyApp::Engine, at: '/'

  post 'callback/:id', to: 'callback#search'

  resources :rates

  get 'retry', to: 'home#retry'

  root to: 'home#index'
end
