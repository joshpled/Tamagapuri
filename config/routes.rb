Rails.application.routes.draw do

  devise_for :users, controllers: {registrations: 'registrations', omniauth_callbacks: 'callbacks'}
  
  root "home#index"
  # put "monster_attributes/:id", to: 'monsters#update_attributes'
  match "monster_attributes/:id" => "monsters#update_attributes", :via => :put, :as => :update_attributes

  resources :inventories, only: [:create, :update]

  resource :user do 
    resources :monsters
  end

  resources :stores do 
    resources :items
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
