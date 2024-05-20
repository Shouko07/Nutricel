class AgregarIdPedidos < ActiveRecord::Migration[7.1]
  def change
    add_column :pedidos, :pedido_id, :integer
  end
end
