require 'rails_helper'

RSpec.describe Quarto, type: :model do
  it "é inválido sem um número" do
    quarto = Quarto.new(numero: nil, andar: "primeiro", preco: 200.0)
    expect(quarto).to_not be_valid
  end

  it "é inválido sem um andar" do
    quarto = Quarto.new(numero: 101, andar: nil, preco: 200.0)
    expect(quarto).to_not be_valid
  end

  it "é inválido com um preço negativo" do
    quarto = Quarto.new(numero: 101, andar: "primeiro", preco: -50.0)
    expect(quarto).to_not be_valid
  end

  it "é inválido com um preço igual a zero" do
    quarto = Quarto.new(numero: 101, andar: "primeiro", preco: 0.0)
    expect(quarto).to_not be_valid
  end

  it "é inválido com um número duplicado" do
    Quarto.create!(numero: 101, andar: "primeiro", preco: 200.0)
    quarto_dup = Quarto.new(numero: 101, andar: "segundo", preco: 250.0)
    expect(quarto_dup).to_not be_valid
  end

  it "retorna a descrição correta" do
    quarto = Quarto.new(numero: 101, andar: "primeiro", preco: 200.0)
    expect(quarto.descricao).to eq("Quarto 101 - Andar: primeiro")
  end
end
