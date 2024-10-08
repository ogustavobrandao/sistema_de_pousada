User.create!(
  nome: 'administrador',
  cpf: '12345678912',
  email: 'admin@gmail.com',
  password: 'password',
  role: 'administrador',
  is_active: true
)

User.create!(
  nome: 'funcionario',
  cpf: '12345678913',
  email: 'funcionario@gmail.com',
  password: 'password',
  role: 'funcionario',
  is_active: true
)

puts "Usuários criados com sucesso!"