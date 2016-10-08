class Reserva < ActiveRecord::Base
  belongs_to :sala
  belongs_to :user
  belongs_to :local
  
  validates :sala, presence: true
  accepts_nested_attributes_for :user
  
  def sala_name
      self.sala.descripcion
  end
  def user_name
      self.user.nombre
  end
  
  def local_name
     self.local.No_Local
  end
  
end
