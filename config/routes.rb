Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
  resources :suggestions do
    resources :suggestion_votes, only: %i[new create]
    resources :comments, only: %i[create]
    resources :comment_votes, only: [:new, :create]
  end

  resources :surveys do
    resources :questions, only: [:create]
  end
  resources :questions, except: [:create] do
    resources :answers, only: [:create]
  end

  get 'surveys/:id/answer', to: 'surveys#respond', as: 'surveys_respond'
end
