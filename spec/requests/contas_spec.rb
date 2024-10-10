# spec/requests/contas_spec.rb
require 'rails_helper'

RSpec.describe "Contas", type: :request do
  let!(:usuario) { create(:user) } 
  let!(:hospede) { create(:user, role: 'hospede', nome: "João Silva", cpf: "12346578123", email: "joao@example.com", password: "password") }
  let!(:funcionario) { create(:user, role: 'funcionario', nome: "Ana Costa", cpf: "12345678124", email: "ana@example.com", password: "password") }
  let!(:administrador) { create(:user, role: 'administrador', nome: "Samuel", cpf: "12354673124", email: "samuel@example.com", password: "password") }

  before do
    sign_in usuario
  end

  describe "Contas" do
    it "cria uma nova conta" do
      expect {
        post contas_path, params: { user: { role: 'administrador', nome: "Maria Silva", cpf: "11122233344", email: "maria@example.com", password: "password", password_confirmation: "password" } }
      }.to change(User, :count).by(1)

      expect(response).to redirect_to(conta_path(User.last))
      follow_redirect!

      expect(response.body).to include("Usuário criado com sucesso.")
    end

    it "lista todas as contas" do
      get contas_path
      expect(response).to have_http_status(:ok)
      expect(response.body).to include("João Silva")
      expect(response.body).to include("Ana Costa")
      expect(response.body).to include("Samuel")
    end

    it "mostra os detalhes de uma conta" do
      get conta_path(hospede.id)
      expect(response).to have_http_status(:ok)
      expect(response.body).to include("João Silva")
    end

    it "atualiza uma conta existente" do
      put conta_path(hospede.id), params: { user: { nome: 'Novo Nome' } }
      expect(response).to redirect_to(conta_path(hospede.id))
      follow_redirect!
      expect(response.body).to include("Usuário atualizado com sucesso.")
    end

    it "remove uma conta" do
      delete conta_path(hospede.id)
      expect(response).to redirect_to(contas_url)
      follow_redirect!
      expect(response.body).to include("Usuário removido com sucesso.")
    end
  end
end
