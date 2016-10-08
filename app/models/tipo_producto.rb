class TipoProducto < ActiveRecord::Base
    has_many :producto
    
    validates :name, presence: true, 
                    uniqueness: {case_sensitive: false}
                    
    validates :estado, presence: true
                  
end
