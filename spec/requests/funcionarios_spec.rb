# spec/requests/funcionarios_spec.rb
require 'rails_helper'

RSpec.describe "Funcionarios", type: :request do
  let!(:usuario) { create(:user) }
  let!(:funcionario) { create(:user, role: 'funcionario', nome: "Ana Costa", cpf: "12345678123", email: "ana@example.com", password: "password") }

  before do
    sign_in usuario
  end

  describe "Funcionários" do
    it "cria um novo funcionário" do
      expect {
        post funcionarios_path, params: { user: { role: 'funcionario', nome: "Maria Silva", cpf: "11122233344", email: "maria@example.com", password: "password", password_confirmation: "password" } }
      }.to change(User, :count).by(1)
      expect(response).to redirect_to(funcionario_path(assigns(:funcionario)))
      follow_redirect!
      expect(response.body).to include("Funcionário criado com sucesso.")
    end

    it "lista todos os funcionários" do
      get funcionarios_path
      expect(response).to have_http_status(:ok)
      expect(response.body).to include("Ana Costa")
    end

    it "mostra os detalhes de um funcionário" do
      get funcionario_path(funcionario.id)
      expect(response).to have_http_status(:ok)
      expect(response.body).to include("Ana Costa")
    end

    it "atualiza um funcionário existente" do
      patch funcionario_path(funcionario.id), params: { user: { email: "ana.novo@example.com" } }
      expect(response).to redirect_to(funcionario_path(funcionario.id))
      follow_redirect!
      expect(funcionario.reload.email).to eq("ana.novo@example.com")
      expect(response.body).to include("Funcionário atualizado com sucesso.")
    end

    it "remove um funcionário" do
      expect {
        delete funcionario_path(funcionario.id)
      }.to change(User, :count).by(-1)
      expect(response).to redirect_to(funcionarios_url)
      follow_redirect!
      expect(response.body).to include("Funcionário removido com sucesso.")
    end
  end
end
