class AddIdForaneoPedido < ActiveRecord::Migration[7.1]
  def change
    add_column :pedidos, :id_producto, :integer
  end
end
