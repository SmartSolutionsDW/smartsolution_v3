json.extract! reserva, :id, :co_reserva, :co_sala, :no_dni, :fe_reserva, :tx_Description, :created_at, :updated_at
json.url reserva_url(reserva, format: :json)