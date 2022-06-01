Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
<<<<<<< HEAD
  resources :suggestions, only: [:new, :show, :create, :update] do
    resources :suggestion_votes, only: [:new, :create]
    resources :comments, only: %i[create]
=======
  resources :suggestions, only: %i[new show create update] do
    resources :suggestion_votes, only: %i[new create]
  end

  resources :surveys, only: %i[new create index]

  resources :suggestions do
    resources :comments, only: %i[create]

>>>>>>> 1c58dc448adeefd6f213c436b767721beba3bd9a
  end
  resources :surveys, only: %i[new create index]

end
