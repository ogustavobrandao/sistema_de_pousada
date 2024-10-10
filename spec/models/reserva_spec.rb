# spec/models/reserva_spec.rb

require 'rails_helper'

RSpec.describe Reserva, type: :model do
  let(:quarto) { Quarto.create!(numero: 101, andar: "primeiro", preco: 200.0) }
  let(:user) { User.create!(nome: "Nome do Hóspede", cpf: "12345678901", email: "hospede@example.com", is_active: true, password: "password", role: "hospede") }

  it "é inválido sem um status" do
    reserva = Reserva.new(status: nil, data_reserva: Date.today, quarto: quarto, user: user)
    expect(reserva).to_not be_valid
  end

  it "é inválido sem uma data de reserva" do
    reserva = Reserva.new(status: "confirmada", data_reserva: nil, quarto: quarto, user: user)
    expect(reserva).to_not be_valid
  end

  it "é inválido sem um quarto" do
    reserva = Reserva.new(status: "confirmada", data_reserva: Date.today, quarto: nil, user: user)
    expect(reserva).to_not be_valid
  end

  it "é inválido sem um usuário" do
    reserva = Reserva.new(status: "confirmada", data_reserva: Date.today, quarto: quarto, user: nil)
    expect(reserva).to_not be_valid
  end

  it "é válido com todos os atributos necessários" do
    reserva = Reserva.new(status: "confirmada", data_reserva: Date.today, quarto: quarto, user: user)
    expect(reserva).to be_valid
  end
end
