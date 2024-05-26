class LlaveF < ActiveRecord::Migration[7.1]
  def change
    remove_column :inventarios, :producto_id
    add_reference :inventarios, :producto, foreign_key: true

  end
end
