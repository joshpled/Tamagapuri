Rails.application.routes.draw do

  resource :slot_machines, only: [:show, :update]
  
  devise_for :users, controllers: {registrations: 'registrations', omniauth_callbacks: 'callbacks'}
  
  root "home#index"
  
  match "monster_attributes/:id" => "monsters#update_attributes", :via => :put, :as => :update_attributes

  resources :inventories, only: :create

  resource :user do 
    resources :monsters
  end

  resources :stores do 
    resources :items
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
