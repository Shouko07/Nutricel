class CreatePedidos < ActiveRecord::Migration[7.1]
  def change
    create_table :pedidos do |t|
      t.integer :cantidad_ordenada
      t.datetime :fecha_inicial
      t.datetime :fecha_entrega

      t.timestamps
    end
  end
end