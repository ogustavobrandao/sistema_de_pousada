User.create!(
  email: 'admin@gmail.com',
  password: 'password',
  role: 'administrador'
)

User.create!(
  email: 'funcionario@gmail.com',
  password: 'password',
  role: 'funcionario'
)

puts "Usuários criados com sucesso!"