Rails.application.routes.draw do
  resources :funcionarios
  resources :hospedes
  resources :reservas
  resources :quartos
  resources :contas

  get 'home/index'
  devise_for :users

  devise_scope :user do
    unauthenticated :user do
      root to: 'devise/sessions#new', as: :unauthenticated_root
    end

    authenticated :user do
      root to: 'home#index', as: :authenticated_root
    end
  end

  root to: 'devise/sessions#new'
  get "up" => "rails/health#show", as: :rails_health_check
end