class AddPrimaryKeyToUsuarios < ActiveRecord::Migration[7.1]
  def change
    add_index :proveedors, :proveedor_id
  end
end