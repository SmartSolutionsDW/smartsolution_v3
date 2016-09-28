json.extract! producto, :id, :tipo_producto_id, :name, :price, :estado, :created_at, :updated_at
json.url producto_url(producto, format: :json)