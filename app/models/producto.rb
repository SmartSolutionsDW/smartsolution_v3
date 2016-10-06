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
  def picture_url
    self.picture.url(:medium)
  end
   
end
