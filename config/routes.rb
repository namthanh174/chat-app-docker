Rails.application.routes.draw do
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  devise_for :users

  root controller: :rooms, action: :index

  resources :room_messages
  resources :rooms

end
