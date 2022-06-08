Rails.application.routes.draw do
  devise_for :users

  # ROOT
  root to: 'pages#home'

  ###################################################### CITOYENS
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

  get 'surveys/:id/answer', to: 'surveys#respond', as: 'survey_respond'
  get 'suggestions/:id/upvote', to: 'suggestions#upvote', as: 'suggestion_upvote'
  get 'suggestions/:id/downvote', to: 'suggestions#downvote', as: 'suggestion_downvote'
  get 'comments/:id/upvote', to: 'comments#upvote', as: 'comment_upvote'
  get 'comments/:id/downvote', to: 'comments#downvote', as: 'comment_downvote'


  ####################################################### NAMESPACE CITY

  namespace :city do
    resources :surveys, except: [:destroy]
    resources :suggestions, only: %i[index update] do
      member do
        patch :change_status
      end
    end
    get 'suggestions/dashboard', to: 'suggestions#dashboard', as: 'suggestions_dashboard'

    get 'survey/:id/display', to: 'surveys#display', as: 'survey_display'
    get 'dashboards/main', to: 'dashboards#dashboard_main', as: 'dashboard_main'
    patch 'surveys/:id/archive', to: 'surveys#archive', as: 'survey_archive'
    get 'suggestions/:id/upvote', to: 'suggestions#upvote', as: 'suggestion_upvote'
    get 'suggestions/:id/downvote', to: 'suggestions#downvote', as: 'suggestion_downvote'
    get 'comments/:id/upvote', to: 'comments#upvote', as: 'comment_upvote'
    get 'comments/:id/downvote', to: 'comments#downvote', as: 'comment_downvote'
  end
end
