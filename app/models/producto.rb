class Producto < ApplicationRecord
    has_many :pedido
    belongs_to :proveedor
end
