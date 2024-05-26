class Inventario < ApplicationRecord
    belongs_to :producto

    before_create :set_next_id
    after_destroy :rearrange_ids
    private

    def set_next_id
        max_id = Inventario.maximum(:inventario_id)
        self.inventario_id = max_id ? max_id + 1 : 1
      end
    
      def rearrange_ids
      inventario = Inventario.order(:inventario_id)
        inventario.each_with_index do |inventario, index|
          inventario.update_column(:inventario_id, index + 1)
        end
      end
end

