Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
  devise_for :users
  resources :users , only: :show
  root to: "prototypes#index"
  resources :prototypes do
    resources :comments, only: :create
  end


end
