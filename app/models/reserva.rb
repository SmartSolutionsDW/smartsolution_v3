class Reserva < ActiveRecord::Base
  belongs_to :sala
  belongs_to :user
  
  validates :sala, presence: true
  accepts_nested_attributes_for :user
  
  def sala_name
      self.sala.descripcion
  end
  def user_name
      self.user.nombre
  end
  
end
