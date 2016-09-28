json.extract! inventario, :id, :local_id, :producto_id, :cant, :precio_compra, :precio_venta, :entrada_salida, :created_at, :updated_at
json.url inventario_url(inventario, format: :json)