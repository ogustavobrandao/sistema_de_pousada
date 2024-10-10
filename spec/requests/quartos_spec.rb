
require 'rails_helper'

RSpec.describe "Quartos", type: :request do
  let!(:usuario) { create(:user) } 
  let!(:quarto) { Quarto.create!(numero: "101", andar: 1, preco: 200.0) }

  before do
    sign_in usuario
  end

  describe "GET /quartos" do
    it "lista todos os quartos" do
      get quartos_path
      expect(response).to have_http_status(:ok)
      expect(response.body).to include(quarto.numero.to_s)
    end
  end

  describe "GET /quartos/:id" do
    it "mostra um quarto" do
      get quarto_path(quarto)
      expect(response).to have_http_status(:ok)
      expect(response.body).to include(quarto.numero.to_s)
    end
  end

  describe "POST /quartos" do
    it "cria um novo quarto" do
      expect {
        post quartos_path, params: { quarto: { numero: "102", andar: 1, preco: 250.0 } }
      }.to change(Quarto, :count).by(1)
      expect(response).to redirect_to(assigns(:quarto))
    end
  end

  describe "POST /quartos" do
    it "não cria um quarto com número duplicado" do
      post quartos_path, params: { quarto: { numero: quarto.numero, andar: quarto.andar, preco: quarto.preco } }
      expect(response).to have_http_status(:unprocessable_entity)
    end
  end

  describe "PATCH /quartos/:id" do
    it "atualiza um quarto" do
      patch quarto_path(quarto), params: { quarto: { preco: 300.0 } }
      expect(quarto.reload.preco).to eq(300.0)
      expect(response).to redirect_to(quarto_path(quarto))
    end
  end

  describe "DELETE /quartos/:id" do
    it "remove um quarto" do
      expect {
        delete quarto_path(quarto)
      }.to change(Quarto, :count).by(-1)
      expect(response).to redirect_to(quartos_path)
    end
  end
end
