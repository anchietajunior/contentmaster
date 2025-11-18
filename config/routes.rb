Rails.application.routes.draw do
  mount Blazer::Engine, at: "blazer"

  resource :session
  resources :passwords, param: :token
  resources :posts
  # Criando todas as rotas necessárias para o posts_controller

  get "up" => "rails/health#show", as: :rails_health_check

  root "posts#index"
end
