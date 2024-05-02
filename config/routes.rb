Rails.application.routes.draw do
  devise_for :users
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
    get '/dashboard', to: 'users#dashboard', as: 'user_dashboard'
    get '/users/:id', to: 'users#show', as: 'user'
  end

  resources :posts
  resources :posts do
    resources :comments, only: [:create, :destroy]
    post 'create_comment', to: 'posts#create_comment' #ruta creare postare
  end

  delete '/posts/:id', to: 'posts#destroy', as: 'delete_post'


  root to: "home#index"
end
