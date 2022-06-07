Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users, only: %i[show]
  resources :comments, only: %i[destroy]

  resources :suggestions do
    resources :suggestion_votes, only: %i[new create]
    resources :comments, only: %i[create edit update]
    resources :comment_votes, only: %i[new create]
  end

  resources :surveys, only: [:respond] do
    resources :questions, only: [:create]
  end
  resources :questions, except: [:create] do
    resources :answers, only: [:create]
  end

  namespace :city do
    resources :surveys
    resources :suggestions, only: %i[update]
    get 'dashboard', to: 'pages#dashboard', as: 'dashboard'
    get 'surveys/:id/display', to: 'surveys#display', as: 'survey_display'
    patch 'surveys/:id/archive', to: 'surveys#archive', as: 'survey_archive'
  end

  get 'surveys/:id/answer', to: 'surveys#respond', as: 'survey_respond'
  get 'suggestions/:id/upvote', to: 'suggestions#upvote', as: 'suggestion_upvote'
  get 'suggestions/:id/downvote', to: 'suggestions#downvote', as: 'suggestion_downvote'
  get 'comments/:id/upvote', to: 'comments#upvote', as: 'comment_upvote'
  get 'comments/:id/downvote', to: 'comments#downvote', as: 'comment_downvote'
end
