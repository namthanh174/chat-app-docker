require 'sidekiq/web'
Sidekiq::Web.app_url = '/'
Rails.application.routes.draw do
  mount Sidekiq::Web => '/sidekiq'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  devise_for :users

  root controller: :rooms, action: :index

  resources :room_messages
  resources :rooms
  get "pokemons", to: "pokemons#index"
  post "pokemons", to: "pokemons#upload"
  delete "pokemons", to: "pokemons#destroy_all"
end
