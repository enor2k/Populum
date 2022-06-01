Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
<<<<<<< HEAD
  resources :suggestions, only: [:new, :show, :create, :update] do
    resources :suggestion_votes, only: [:new, :create]
=======

  resources :surveys, only: %i[new create index]

  resources :suggestions do
    resources :comments, only: %i[create]
>>>>>>> master
  end
end
