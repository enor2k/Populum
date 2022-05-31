Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :suggestions, only: [:new, :show, :create] do
    resources :comments, only: [:create]
  end
end
