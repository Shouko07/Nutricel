class Pedido < ApplicationRecord
    belongs_to :usuario
    belongs_to :producto

    before_create :set_next_id
    after_destroy :rearrange_ids

    validate :suficientes_existencias

    private

    def suficientes_existencias
    if cantidad_ordenada.present? && producto.present? && producto.inventario.present?
      if cantidad_ordenada > producto.inventario.existencias
        errors.add(:cantidad_ordenada, "no hay suficientes existencias disponibles para #{producto.nombre}")
      end
    end
  end
    def set_next_id
        last_order = usuario.pedido.order(:pedido_id).last
        self.pedido_id = last_order ? last_order.pedido_id + 1 : 1
      end
    
      def rearrange_ids
        pedido = usuario.pedido.order(:pedido_id)
        pedido.each_with_index do |pedido, index|
          pedido.update_column(:pedido_id, index + 1)
        end
      end
end

