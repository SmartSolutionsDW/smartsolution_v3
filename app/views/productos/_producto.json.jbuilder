json.extract! producto, :id, :Co_Producto, :No_Producto, :Ss_Precio, :Ct_Stock, :tipo_producto_id, :created_at, :updated_at
json.url producto_url(producto, format: :json)