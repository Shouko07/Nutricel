json.extract! producto, :id, :id_producto, :nombre, :precio, :peso, :imagen, :fecha_expiracion, :created_at, :updated_at
json.url producto_url(producto, format: :json)
