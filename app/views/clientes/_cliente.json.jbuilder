json.extract! cliente, :id, :nombre, :apellido_paterno, :apellido_materno, :correo, :telefono, :calle, :colonia, :codigo_postal, :ciudad, :pais, :created_at, :updated_at
json.url cliente_url(cliente, format: :json)
