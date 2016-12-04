Rails.application.routes.draw do

  root to: 'pages#home'

  get 'pages/profile'

  get 'auth/github', as: :github_auth

  match 'auth/:provider/callback', to: 'sessions#create', via: [:post, :get]

  get 'sessions/destroy', as: :logout

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
