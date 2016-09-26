class TipoProducto < ActiveRecord::Base
    has_many :productos
    include Loggable 
end
