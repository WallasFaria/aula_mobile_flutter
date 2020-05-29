Rails.application.routes.draw do
  resources :perfils, only: [:create, :update, :destroy] do
    get 'me', on: :collection
  end

  resources :produtos
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
