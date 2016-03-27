Rails.application.routes.draw do
  mount ShopifyApp::Engine, at: '/'

  post 'callback/:id', to: 'callback#search'

  resources :rates do
    end

  root to: 'home#index'
end
