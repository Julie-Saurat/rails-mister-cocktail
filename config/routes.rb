Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "cocktails#index"

  resources :cocktails, only: [:index, :edit, :show, :new, :create, :update] do
    resources :doses, only: [:new, :create]
  end

  resources :doses, only: [:destroy]

end
