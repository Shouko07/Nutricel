class CreateOrdenProductos < ActiveRecord::Migration[7.1]
  def change
    create_table :orden_productos do |t|
      t.integer :folio_id
      t.integer :cantidad_ordenada
      t.datetime :fecha_inicial
      t.datetime :fecha_entrega
      t.integer :proveedor_id
      t.integer :producto_id

      t.timestamps
    end
  end
end
