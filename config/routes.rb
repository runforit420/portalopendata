Rails.application.routes.draw do
  devise_for :users
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
    get '/dashboard', to: 'users#dashboard', as: 'user_dashboard'
    get '/users/:id', to: 'users#show', as: 'user'
  end

  resources :posts do
    resources :comments, only: [:create, :destroy]
    post 'create_comment', to: 'posts#create_comment' #ruta creare postare
  end

  delete '/posts/:id', to: 'posts#destroy', as: 'delete_post'

  # Define routes for the new categories pages
  get '/castiguri', to: 'categorii#Castiguri', as: 'castiguri'
  get '/populatie', to: 'categorii#Populatie', as: 'population'
  get '/sanatate', to: 'categorii#Sanatate', as: 'sanatate'
  get '/educatie', to: 'categorii#Educatie', as: 'educatie'
  get '/cultura', to: 'categorii#Cultura', as: 'cultura'
  get '/sport', to: 'categorii#Sport', as: 'sport'

  root to: "home#index"
end