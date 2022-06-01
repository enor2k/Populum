Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :suggestions, only: [:index]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :surveys

  resources :suggestions, only: %i[new show create] do
    resources :comments, only: %i[create]
  end
end
