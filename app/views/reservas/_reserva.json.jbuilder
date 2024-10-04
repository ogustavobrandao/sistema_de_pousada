json.extract! reserva, :id, :cliente_nome, :status, :data_reserva, :quarto_id, :created_at, :updated_at
json.url reserva_url(reserva, format: :json)
