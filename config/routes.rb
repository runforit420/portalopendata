Rails.application.routes.draw do
  devise_for :users

  resources :posts do
    resources :comments, only: [:create, :destroy]
    post 'create_comment', to: 'posts#create_comment' # Adăugăm ruta pentru create_comment
  end

  delete '/posts/:id', to: 'posts#destroy', as: 'delete_post'

  get '/posts/styles.css', to: 'application#styles', format: 'css'

  root to: "home#index"
end

