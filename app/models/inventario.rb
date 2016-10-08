class Inventario < ActiveRecord::Base
  belongs_to :local
  belongs_to :producto
  
  def local_name
    self.local.No_Local
  end
  def producto_name
    self.producto.name
  end
  
                    
    validates :cant, presence: true, 
                 numericality: { greater_than_or_equal_to: 0 }
    
      validates :precio_compra, presence: true, 
                 numericality: { greater_than_or_equal_to: 0 }
    
      validates :precio_venta, presence: true, 
                 numericality: { greater_than_or_equal_to: 0 }

end
