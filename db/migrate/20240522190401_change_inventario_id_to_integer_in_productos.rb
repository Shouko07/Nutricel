class ChangeInventarioIdToIntegerInProductos < ActiveRecord::Migration[7.1]
  def change
    change_column :inventarios, :inventario_id, 'integer USING CAST(inventario_id AS integer)'
  end
end
