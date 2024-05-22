class Producto < ApplicationRecord
    has_many :pedido
    belongs_to :proveedor
  
  
    before_create :set_next_id
    after_destroy :rearrange_ids

    has_one :inventario, dependent: :destroy
    after_create :create_inventario_record  
    private
  
    def create_inventario_record
      create_inventario(existencias: 0) 
    end

    def set_next_id
      max_id = Producto.maximum(:producto_id)
      self.producto_id = max_id ? max_id + 1 : 1
    end
  
    def rearrange_ids
      productos = Producto.order(:producto_id)
      productos.each_with_index do |producto, index|
        producto.update_column(:producto_id, index + 1)
      end
    end

  end