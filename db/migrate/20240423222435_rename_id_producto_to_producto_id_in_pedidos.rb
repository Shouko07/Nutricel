class RenameIdProductoToProductoIdInPedidos < ActiveRecord::Migration[7.1]
  def change
    rename_column :pedidos, :id_producto, :producto_id
    rename_column :productos, :id_producto, :producto_id

  end
end
