class CreateClientes < ActiveRecord::Migration[7.1]
  def change
    create_table :clientes do |t|
      t.text :nombre
      t.text :apellido_paterno
      t.text :apellido_materno
      t.text :correo
      t.text :telefono
      t.text :calle
      t.text :colonia
      t.text :codigo_postal
      t.text :ciudad
      t.text :pais

      t.timestamps
    end
  end
end
