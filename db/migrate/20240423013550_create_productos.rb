class CreateProductos < ActiveRecord::Migration[7.1]
  def change
    create_table :productos do |t|
      t.integer :id_producto
      t.string :nombre
      t.decimal :precio
      t.decimal :peso
      t.string :imagen
      t.datetime :fecha_expiracion

      t.timestamps
    end
  end
end
