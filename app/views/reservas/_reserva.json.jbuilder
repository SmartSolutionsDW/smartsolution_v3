json.extract! reserva, :id, :sala_id, :user_id, :fe_reserva, :descripcion, :estado, :aprobado, :created_at, :updated_at
json.url reserva_url(reserva, format: :json)