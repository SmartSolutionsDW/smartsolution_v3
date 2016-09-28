json.extract! tipo_producto, :id, :name, :estado, :created_at, :updated_at
json.url tipo_producto_url(tipo_producto, format: :json)