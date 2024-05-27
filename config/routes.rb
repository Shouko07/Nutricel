Rails.application.routes.draw do
  resources :inventarios
  resources :orden_productos
  resources :proveedors
  get 'chatbot/index'
  resources :productos
  resources :pedidos
  resource :chat_responses, only: [:show]

  devise_for :usuarios, controllers: {
    registrations: 'users/registrations'
  }
  
  resources :usuarios
  get 'home/menu'
  get 'home/about'
  get 'home/faq'
  get '/404', to: 'errors#not_found'
  get '/500', to: 'errors#internal_server_error'


  root 'home#index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
