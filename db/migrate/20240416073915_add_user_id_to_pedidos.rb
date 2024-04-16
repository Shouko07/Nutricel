class AddUserIdToPedidos < ActiveRecord::Migration[7.1]
  def change
    add_column :pedidos, :pedido_id, :integer
    add_index :pedidos, :pedido_id
  end
end
