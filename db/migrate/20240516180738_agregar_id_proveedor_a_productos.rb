class AgregarIdProveedorAProductos < ActiveRecord::Migration[7.1]
  def change
    add_column :productos, :proveedor_id, :integer
  end
end
