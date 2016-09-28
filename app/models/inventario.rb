class Inventario < ActiveRecord::Base
  belongs_to :local
  belongs_to :producto
  
  def local_name
    self.local.No_Local
  end
  def producto_name
    self.producto.name
  end

end
