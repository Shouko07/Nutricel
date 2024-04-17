class Pedido < ActiveRecord::Migration[7.1]
  def change
    drop_table :pedidos
  end
end
