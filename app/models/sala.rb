class Sala < ActiveRecord::Base
  belongs_to :local 
  has_many :reserva
  validates :local, presence: true
   def local_name
      self.local.No_Local
  end
  validates :no_sala, presence: true, 
                    uniqueness: {case_sensitive: false}
                    
    validates :qt_capacidad, presence: true, 
                 numericality: { greater_than_or_equal_to: 0 }
end
