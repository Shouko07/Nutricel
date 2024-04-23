class AgregarAUsuarios < ActiveRecord::Migration[7.1]
  def change
    add_column :usuarios, :nombre, :string
    add_column :usuarios, :apellido_paterno, :string
    add_column :usuarios, :apellido_materno, :string
    add_column :usuarios, :telefono, :string
    add_column :usuarios, :calle, :string
    add_column :usuarios, :colonia, :string
    add_column :usuarios, :codigo_postal, :string
    add_column :usuarios, :ciudad, :string
    add_column :usuarios, :pais, :string
  end
end