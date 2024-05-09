class CreateProveedors < ActiveRecord::Migration[7.1]
  def change
    create_table :proveedors do |t|
      t.integer :proveedor_id
      t.string :nombre
      t.string :telefono
      t.string :direccion
      t.string :correo
      t.string :apellido_paterno
      t.string :apellido_materno

      t.timestamps
    end
  end
end
