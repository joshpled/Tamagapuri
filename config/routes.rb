Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: "registrations", omniauth_callbacks: "callbacks" }

  root "home#home"

  match "monster_attributes/:id" => "monsters#update_attributes", :via => :put, :as => :update_attributes

  resources :inventories, only: :create
  resource :slot_machines, only: [:show, :update]
  resources :items, only: :index

  resources :users do
    resources :monsters, except: :index
  end

  get '*path' => redirect('/')

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
