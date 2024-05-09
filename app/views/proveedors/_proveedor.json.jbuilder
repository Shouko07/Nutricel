json.extract! proveedor, :id, :proveedor_id, :nombre, :telefono, :direccion, :correo, :apellido_paterno, :apellido_materno, :created_at, :updated_at
json.url proveedor_url(proveedor, format: :json)
