Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :suggestions, only: [:new, :show, :create, :update] do
    resources :suggestion_votes, only: [:new, :create]
    resources :comments, only: %i[create]
  end
  resources :surveys, only: %i[new create index]

end
