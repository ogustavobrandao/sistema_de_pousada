# spec/models/user_spec.rb
require 'rails_helper'

RSpec.describe User, type: :model do
  before(:each) do
   
    User.delete_all
  end

  context "quando é um hóspede" do
    it "é válido com todos os atributos presentes" do
      user = User.new(
        nome: "João Silva",
        email: "joao@example.com",
        cpf: "12345678901",
        role: "hospede",
        is_active: true,
        password: "senha123",
        password_confirmation: "senha123" 
      )
      expect(user).to be_valid
    end

    it "é inválido sem nome" do
      user = User.new(nome: nil, email: "joao@example.com", cpf: "12345678901", role: "hospede", is_active: true, password: "senha123", password_confirmation: "senha123")
      expect(user).to_not be_valid
      expect(user.errors[:nome]).to include("can't be blank")
    end

    it "é inválido sem um email" do
      user = User.new(nome: "João Silva", email: nil, cpf: "12345678901", role: "hospede", is_active: true, password: "senha123", password_confirmation: "senha123")
      expect(user).to_not be_valid
      expect(user.errors[:email]).to include("can't be blank")
    end

    it "é inválido com um email duplicado" do
      User.create!(
        nome: "João Silva",
        email: "joao@example.com",
        cpf: "12345678901",
        role: "hospede",
        is_active: true,
        password: "senha123", 
        password_confirmation: "senha123" 
      )

      user_duplicado = User.new(
        nome: "Maria Souza",
        email: "joao@example.com",
        cpf: "98765432101",
        role: "hospede",
        is_active: true,
        password: "senha123", 
        password_confirmation: "senha123" 
      )

      expect(user_duplicado).to_not be_valid
      expect(user_duplicado.errors[:email]).to include("has already been taken")
    end

    it "é inválido com CPF duplicado" do
      User.create!(
        nome: "João Silva",
        email: "joao@example.com",
        cpf: "12345678901",
        role: "hospede",
        is_active: true,
        password: "senha123",
        password_confirmation: "senha123"
      )

      user_duplicado = User.new(
        nome: "Maria Souza",
        email: "maria@example.com",
        cpf: "12345678901", 
        role: "hospede",
        is_active: true,
        password: "senha123",
        password_confirmation: "senha123"
      )

      expect(user_duplicado).to_not be_valid
      expect(user_duplicado.errors[:cpf]).to include("has already been taken")
    end
  end
end
