class FixColumnName < ActiveRecord::Migration[7.1]
  def change
    rename_column :pedidos, :pedido_id, :usuario_id
    # Renombrar el índice también
    rename_index :pedidos, 'index_pedidos_on_pedido_id', 'index_pedidos_on_usuario_id' 
  end
end
