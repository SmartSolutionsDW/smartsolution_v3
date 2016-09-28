class Evento < ActiveRecord::Base
  belongs_to :local
   validates :local, presence: true
   def local_name
      self.local.No_Local
  end
end
