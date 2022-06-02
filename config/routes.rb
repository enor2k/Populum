Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
  resources :suggestions do
    resources :suggestion_votes, only: [:new, :create]
    resources :comments, only: %i[create]
  end

  resources :surveys do
    resources :questions, only: [] do
      resources :answers, only: %i[new create]
    end
  end
end
