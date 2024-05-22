class LlavePrimariaInventarios < ActiveRecord::Migration[7.1]
  def change
    add_index :inventarios, :inventario_id
  end
end
