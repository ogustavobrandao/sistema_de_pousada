# spec/requests/hospedes_spec.rb
require 'rails_helper'

RSpec.describe "Hospedes", type: :request do
  let!(:usuario) { create(:user) }  # Usando FactoryBot para criar o usuário
  let!(:hospede) { create(:user, role: 'hospede', nome: "João Silva", cpf: "12345678123", email: "joao@example.com", password: "password") }

  before do
    sign_in usuario
  end

  describe "Hóspedes" do
    it "cria um novo hóspede" do
      expect {
        post hospedes_path, params: { user: { role: 'hospede', nome: "Maria Souza", cpf: "11122233344", email: "maria@example.com", password: "password", password_confirmation: "password" } }
      }.to change(User, :count).by(1)
      expect(response).to redirect_to(hospede_path(assigns(:hospede)))
      follow_redirect!
      expect(response.body).to include("Hóspede criado com sucesso.")
    end

    it "lista todos os hóspedes" do
      get hospedes_path
      expect(response).to have_http_status(:ok)
      expect(response.body).to include("João Silva")
    end

    it "mostra os detalhes de um hóspede" do
      get hospede_path(hospede.id)
      expect(response).to have_http_status(:ok)
      expect(response.body).to include("João Silva")
    end

    it "atualiza um hóspede existente" do
      patch hospede_path(hospede.id), params: { user: { email: "joao.novo@example.com" } }
      expect(response).to redirect_to(hospede_path(hospede.id))
      follow_redirect!
      expect(hospede.reload.email).to eq("joao.novo@example.com")
      expect(response.body).to include("Hóspede atualizado com sucesso.")
    end

    it "remove um hóspede" do
      expect {
        delete hospede_path(hospede.id)
      }.to change(User, :count).by(-1)
      expect(response).to redirect_to(hospedes_url)
      follow_redirect!
      expect(response.body).to include("Hóspede removido com sucesso.")
    end
  end
end
