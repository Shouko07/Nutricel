class IndiceProducto < ActiveRecord::Migration[7.1]
  def change
    add_index :productos, :id_producto

  end
end
