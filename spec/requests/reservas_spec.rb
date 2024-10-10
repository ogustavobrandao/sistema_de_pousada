require 'rails_helper'

RSpec.describe 'Reservas', type: :request do
  let(:valid_attributes) { { data_inicio: '2024-01-01', data_fim: '2024-01-05', hospede_id: 1, quarto_id: 1 } }
  let(:invalid_attributes) { { data_inicio: '', data_fim: '2024-01-05' } }

  describe 'GET /reservas' do
    it 'lista todas as reservas' do
      create(:reserva, valid_attributes)
      get reservas_path
      expect(response).to be_successful
    end
  end

  describe 'POST /reservas' do
    it 'cria uma nova reserva' do
      expect {
        post reservas_path, params: { reserva: valid_attributes }
      }.to change(Reserva, :count).by(1)
    end

    it 'não cria uma reserva com atributos inválidos' do
      expect {
        post reservas_path, params: { reserva: invalid_attributes }
      }.to change(Reserva, :count).by(0)
    end
  end

  describe 'GET /reservas/:id' do
    it 'visualiza uma reserva' do
      reserva = create(:reserva, valid_attributes)
      get reserva_path(reserva)
      expect(response).to be_successful
    end
  end

  describe 'PATCH /reservas/:id' do
    it 'atualiza uma reserva' do
      reserva = create(:reserva, valid_attributes)
      patch reserva_path(reserva), params: { reserva: { data_fim: '2024-01-06' } }
      expect(reserva.reload.data_fim).to eq('2024-01-06')
    end
  end

  describe 'DELETE /reservas/:id' do
    it 'remove uma reserva' do
      reserva = create(:reserva, valid_attributes)
      expect {
        delete reserva_path(reserva)
      }.to change(Reserva, :count).by(-1)
    end
  end
end