class Producto < ActiveRecord::Base
  belongs_to :tipo_producto
  has_many :inventario
  validates :tipo_producto, presence: true
    has_attached_file :picture,   

    styles: { thumb: '100x100>', medium: '300x300>'},   

    default_url: '/images/:style/missing.png' 

  validates_attachment :picture,   

    content_type: { content_type: ['image/jpeg', 'image/png', 'image/gif'] } 
  
   def tipo_producto_name
      self.tipo_producto.name
   end
   
   validates :name, presence: true, 
                    uniqueness: {case_sensitive: false}
                    
    validates :price, presence: true, 
                 numericality: { greater_than_or_equal_to: 0 }
                 
    validates :estado, presence: true, 
                    uniqueness: {case_sensitive: false}
                   
end
