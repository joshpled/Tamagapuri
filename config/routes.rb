Rails.application.routes.draw do
  devise_for :users, controllers: {registrations: 'registrations', omniauth_callbacks: 'callbacks'}

  get '/user_items', to: "items#user_items"
  patch '/user_buys_item/:item_id', to: "items#user_buys_item"
  root "home#index"

  resource :user do 
    resources :monsters
  end

  resources :stores do 
    resources :items
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
