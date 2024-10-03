Rails.application.routes.draw do
  get 'home/index'
  devise_for :users

  devise_scope :user do
    # Define a rota raiz para quando o usuário não estiver autenticado
    unauthenticated :user do
      root to: 'devise/sessions#new', as: :unauthenticated_root
    end

    # Define a rota raiz para quando o usuário estiver autenticado
    authenticated :user do
      root to: 'home#index', as: :authenticated_root
    end
  end

  # Outras rotas
  get "up" => "rails/health#show", as: :rails_health_check
end