class CreateInventarios < ActiveRecord::Migration[7.1]
  def change
    create_table :inventarios do |t|
      t.string :inventario_id
      t.string :existencias
      t.string :producto_id

      t.timestamps
    end
  end
end
