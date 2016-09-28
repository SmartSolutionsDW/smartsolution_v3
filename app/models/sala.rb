class Sala < ActiveRecord::Base
  belongs_to :local 
  has_many :reserva
  validates :local, presence: true
   def local_name
      self.local.No_Local
  end
end
