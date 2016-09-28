json.extract! evento, :id, :local_id, :fe_evento, :capacidad, :descripcion, :created_at, :updated_at
json.url evento_url(evento, format: :json)