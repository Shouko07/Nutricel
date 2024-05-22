class Pedido < ApplicationRecord
    belongs_to :usuario
    belongs_to :producto

    before_create :set_next_id
    after_destroy :rearrange_ids
    private

    def set_next_id
        max_id = Pedido.maximum(:pedido_id)
        self.pedido_id = max_id ? max_id + 1 : 1
      end
    
      def rearrange_ids
        pedido = Pedido.order(:pedido_id)
        pedido.each_with_index do |pedido, index|
          pedido.update_column(:pedido_id, index + 1)
        end
      end
end

