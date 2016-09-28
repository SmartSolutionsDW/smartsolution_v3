class Producto < ActiveRecord::Base
  belongs_to :tipo_producto
  validates :tipo_producto, presence: true
  
   def tipo_producto_name
      self.tipo_producto.name
  end
end
