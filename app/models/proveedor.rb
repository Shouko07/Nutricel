class Proveedor < ApplicationRecord
    has_many :producto

    before_create :set_next_id
    after_destroy :rearrange_ids
    private

    def set_next_id
        max_id = Proveedor.maximum(:proveedor_id)
        self.proveedor_id = max_id ? max_id + 1 : 1
      end
    
      def rearrange_ids
        proveedor = Proveedor.order(:proveedor_id)
        proveedor.each_with_index do |proveedor, index|
          proveedor.update_column(:proveedor_id, index + 1)
        end
      end
end
