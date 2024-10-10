json.extract! conta, :id, :nome, :cpf, :email, :created_at, :updated_at
json.url conta_url(conta, format: :json)
