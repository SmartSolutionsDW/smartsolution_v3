class IntranetController < ApplicationController
  
    
   def intranet
    logger.debug "<<<<<intranet 1111>>>>> "
    
    
   end
    
   def login
       
       
    @intranet=Employee.new
    logger.debug "<<<<<login 1111>>>>> #{ @intranet.inspect}"
    
      
      
   end
    
   def intento_sesion
        logger.debug "<<<<<intento_sesion 1111>>>>> "
        a=params[:dni]
        logger.debug "<<<<<intento_sesion 1111 #{a}>>>>> "
        @employee=Employee.find_by(dni: params[:dni], password: params[:password] )
       logger.debug "<<<<<login 1111>>>>>#{@employee.inspect}"
       if @employee != nil
        
          render action: "intranet"
          
       else
            redirect_to login_path
       end
   
   end
   
   def sesion
       
   end
   
   def employee_params
       params.permit(:nombre, :apellido, :dni, :correo, :password, :admin)
       #params.require(:employee).permit(:nombre, :apellido, :dni, :correo, :password, :admin)
   end
   
end
