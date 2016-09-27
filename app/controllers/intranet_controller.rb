class IntranetController < ApplicationController
  before_action :login_empleado
   
   @employee = nil
   
   
   def intranet
      logger.debug "<<<<<intranet 1111>>>>> "
      
    
      if(session[:intranet])
         @employee=session[:intranet]
        # logger.debug "<<<<< empelado no vacio >>>>>  #{@employee.inspect} - #{@employee['dni']}"
         session[:intranet]= Employee.find_by(dni: @employee['dni'], password:  @employee['password'] )
         @employee=session[:intranet]
         
      else
         logger.debug "<<<<< empelado vacio >>>>> "
         @intranet=Employee.new
         render action: 'login'
      end
    
   end
    
   def login
       
       
    @employee=Employee.new
    logger.debug "<<<<<login 1111>>>>> #{ @employee.inspect}"
    
      
      
   end
    
   def intento_sesion
        logger.debug "<<<<<intento_sesion 1111>>>>> "
        a=params[:dni]
        b=params["employees.password"]
        logger.debug "<<<<<intento_sesion 1111 #{a}>>>>> "
        logger.debug "<<<<<intento_sesion b #{b}>>>>> "
        @employee=Employee.find_by(dni: params[:dni], password: params[:password] )
       logger.debug "<<<<<login 1111>>>>>#{@employee.inspect}"
       if @employee != nil
         session[:intranet]=@employee
         logger.debug "<<<<<sesion empleado>>>>>  #{session[:intranet].inspect}"
         logger.debug "<<<<<sesion empleado>>>>>  #{session[:intranet].nombre}"
          #render action: "intranet"
          redirect_to intranet_path
          
       else
            flash[:danger] = 'Invalid email/password combination' # Not quite right!
            redirect_to login_path
       end
   
   end
   
  def cerrar_sesion
   logger.debug "<<<<<cerrar_sesion>>>>> "
   session[:intranet]=nil
   render action: 'login'
  end
   
   def employee_params
       params.permit(:nombre, :apellido, :dni, :correo, :password, :admin)
       #params.require(:employee).permit(:nombre, :apellido, :dni, :correo, :password, :admin)
   end
   
   def login_empleado
       logger.debug "<<<<<sesion empleado en application controller>>>>>" 
       @empleado = session[:intranet] if session[:intranet]
   end
end
