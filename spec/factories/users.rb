FactoryBot.define do
    factory :user do
      nome { "Nome do Usuário" }
      email { "usuario@example.com" }
      cpf { "12345678901" }
      password { "senhaSegura" }
      role { "administrador" }
      is_active { true }
  
    end
  end
  