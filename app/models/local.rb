class Local < ActiveRecord::Base
    has_many :sala 
    has_many :evento
     #attr_accessible :id, :descripcion
     

    logger.debug "<<<<< LOCAL 1 #{ self.inspect}>>>>> "
    #logger.debug "<<<<< LOCAL 2 #{ self.locals.no_local}>>>>> "
    #logger.debug "<<<<< LOCAL 3 #{ self.locals.id}>>>>> "
end
