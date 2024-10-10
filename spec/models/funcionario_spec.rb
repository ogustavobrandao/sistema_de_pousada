require 'rails_helper'

RSpec.describe User, type: :model do
  context "quando é um funcionário" do
    it "é válido com todos os atributos presentes" do
      user = User.new(
        nome: "Carlos Souza",
        email: "carlos@example.com",
        cpf: "12345678901",
        role: "funcionario",
        is_active: true,
        password: "senha123"
      )
      expect(user).to be_valid
    end

    it "é inválido sem um nome" do
      user = User.new(
        nome: nil,
        email: "carlos@example.com",
        cpf: "12345678901",
        role: "funcionario",
        is_active: true,
        password: "senha123"
      )
      expect(user).to_not be_valid
    end

    it "é inválido com um email duplicado" do
      User.create!(
        nome: "Carlos Souza",
        email: "carlos@example.com",
        cpf: "12345678901",
        role: "funcionario",
        is_active: true,
        password: "senha123"
      )
      user_dup = User.new(
        nome: "Outro Funcionario",
        email: "carlos@example.com",
        cpf: "98765432100",
        role: "funcionario",
        is_active: true,
        password: "senha123"
      )
      expect(user_dup).to_not be_valid
    end

    it "é inválido com um CPF duplicado" do
      User.create!(
        nome: "Carlos Souza",
        email: "carlos@example.com",
        cpf: "12345678901",
        role: "funcionario",
        is_active: true,
        password: "senha123"
      )
      user_dup = User.new(
        nome: "Outro Funcionario",
        email: "outro@example.com",
        cpf: "12345678901",
        role: "funcionario",
        is_active: true,
        password: "senha123"
      )
      expect(user_dup).to_not be_valid
    end

    it "é inválido sem o campo is_active" do
      user = User.new(
        nome: "Carlos Souza",
        email: "carlos@example.com",
        cpf: "12345678901",
        role: "funcionario",
        is_active: nil,
        password: "senha123"
      )
      expect(user).to_not be_valid
    end
  end
end
