require 'rails_helper'

RSpec.describe User, type: :model do
  let!(:user) do
    User.create!(
      nome: "Carlos Souza", 
      email: "carlos@example.com", 
      cpf: "12345678901", 
      role: "funcionario", 
      is_active: true, 
      password: "senha123", 
      password_confirmation: "senha123"
    )
  end

  it "permite autenticação com email e senha válidos" do
    expect(user.valid_password?("senha123")).to be true
  end

  it "não permite autenticação com senha incorreta" do
    expect(user.valid_password?("senhaerrada")).to be false
  end

  it "é inválido sem email" do
    user.email = nil
    expect(user).to_not be_valid
  end

  it "não permite email duplicado" do
    user_dup = User.new(
      nome: "João Silva", 
      email: "carlos@example.com", 
      cpf: "98765432101", 
      role: "hospede", 
      is_active: true, 
      password: "senha123", 
      password_confirmation: "senha123"
    )
    expect(user_dup).to_not be_valid
  end

  it "é inválido sem uma senha" do
    user.password = nil
    expect(user).to_not be_valid
  end
end
