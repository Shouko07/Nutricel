class CrearIndicePedidos < ActiveRecord::Migration[7.1]
  def change
    add_index :pedidos, :usuario_id
  end
end
