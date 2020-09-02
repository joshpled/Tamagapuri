Rails.application.routes.draw do

  devise_for :users, controllers: {registrations: 'registrations', omniauth_callbacks: 'callbacks'}
  
  root "home#index"
  
  get "/user/items", to: "home#items", as: 'user_items'
  
  resources :inventories, only: :create

  resource :user do 
    resources :monsters
  end

  resources :stores do 
    resources :items
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
