# spec/models/logout_spec.rb

require 'rails_helper'

RSpec.describe 'User Authentication Logout', type: :request do
  let!(:user) do
    User.create!(
      nome: 'Test User',
      email: 'testuser@example.com',
      password: 'password123',
      password_confirmation: 'password123',
      cpf: '12345678901', 
      role: 'administrador'
    )
  end

  before do
    post user_session_path, params: { user: { email: user.email, password: user.password } }
  end

  describe 'Logout' do
    it 'desconecta um usuário autenticado' do
      delete destroy_user_session_path
      expect(response).to redirect_to(root_path)
    end

    it 'redireciona para a página inicial após logout' do
      delete destroy_user_session_path
      follow_redirect!
      expect(response.body).to include('Login') 
    end

    it 'não permite acesso a áreas protegidas após logout' do
      delete destroy_user_session_path
      follow_redirect!
      get funcionarios_path 
      expect(response).to redirect_to(new_user_session_path) 
    end

    it 'não mostra áreas protegidas após logout' do
      delete destroy_user_session_path
      follow_redirect! 
      get funcionarios_path 
      expect(response).to redirect_to(new_user_session_path) 
    end

    it 'mostra uma mensagem de sucesso após logout' do
      delete destroy_user_session_path
      follow_redirect! 
      expect(response.body).to include('Signed out successfully.')
    end
  end
end
