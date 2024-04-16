class CreateClientes < ActiveRecord::Migration[7.1]
  def change
    create_table :clientes do |t|
      t.string :nombre
      t.string :apellido_paterno
      t.string :apellido_materno
      t.string :correo
      t.string :telefono
      t.string :calle
      t.string :colonia
      t.string :codigo_postal
      t.string :ciudad
      t.string :pais

      t.timestamps
    end
  end
end
