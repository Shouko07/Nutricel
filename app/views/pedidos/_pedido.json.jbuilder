json.extract! pedido, :id, :cantidad_ordenada, :fecha_inicial, :fecha_entrega, :created_at, :updated_at
json.url pedido_url(pedido, format: :json)
