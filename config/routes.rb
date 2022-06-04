Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users, only: %i[show]
  resources :comments, only: %i[ destroy ]

  resources :suggestions do
    resources :suggestion_votes, only: %i[new create]
    resources :comments, only: %i[create edit update]
    resources :comment_votes, only: %i[new create]
  end

  resources :surveys do
    resources :questions, only: [:create]
  end
  resources :questions, except: [:create] do
    resources :answers, only: [:create]
  end

  get 'surveys/:id/answer', to: 'surveys#respond', as: 'surveys_respond'
  get 'suggestions/:id/upvote', to: 'suggestions#upvote', as: 'suggestion_upvote'
  get 'suggestions/:id/downvote', to: 'suggestions#downvote', as: 'suggestion_downvote'
  get 'comments/:id/upvote', to: 'comments#upvote', as: 'comment_upvote'
  get 'comments/:id/downvote', to: 'comments#downvote', as: 'comment_downvote'
end
