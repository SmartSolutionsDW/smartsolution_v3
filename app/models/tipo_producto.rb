class TipoProducto < ActiveRecord::Base
    has_many :productos
end
