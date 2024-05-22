class ChangeExistenciasToIntegerInProductos < ActiveRecord::Migration[7.1]
  def change
    change_column :inventarios, :existencias, 'integer USING CAST(existencias AS integer)'
  end
end
