json.extract! orden_producto, :id, :folio_id, :cantidad_ordenada, :fecha_inicial, :fecha_entrega, :proveedor_id, :producto_id, :created_at, :updated_at
json.url orden_producto_url(orden_producto, format: :json)
