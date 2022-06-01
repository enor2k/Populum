Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :suggestions, only: %i[new show create update] do
    resources :suggestion_votes, only: %i[new create]
  end

  resources :surveys

  resources :suggestions do
    resources :comments, only: %i[create]

  end
end
