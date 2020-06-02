Rails.application.routes.draw do
  scope :defaults => { :format => 'application/json' } do
    resources :perfils, only: [:create, :update, :destroy] do
      get 'me', on: :collection
    end

    resources :produtos
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
