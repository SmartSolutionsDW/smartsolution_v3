class Producto < ActiveRecord::Base
  belongs_to :tipo_producto
  def nombre_producto    
    self.tipo_producto.co_coTipoProducto  
   end
   
end
