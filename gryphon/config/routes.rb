Rails.application.routes.draw do

  root to: 'pages#home'

  get '/pages/profile'

  get '/auth/github', as: :github_auth

  match '/auth/:provider/callback', to: 'sessions#create',  via: [:post, :get]
  match '/auth/failure',            to: 'sessions#failure', via: [:post, :get]

  post '/logout', to: 'sessions#destroy', as: 'logout'

end
