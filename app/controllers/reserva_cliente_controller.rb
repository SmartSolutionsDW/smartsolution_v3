class ReservaClienteController < ApplicationController
    before_action :validar_clie
    
    def reservacli
        logger.debug"<<<< REserva de Cliente #{ current_user.inspect}<<<<"
        self.validar_clie
        
        @reserva_cli=Reserva.where(user_id: current_user.id)
        self.mensaje
    end
    
    def new
        logger.debug"<nuevo>"
        self.validar_clie
        logger.debug"<nuevo pasó>"
        @reserva_cli = Reserva.new
        
        
    
    end
    
    def create
         #self.validar_admin
         logger.debug"<create 0>"
         logger.debug"<<< parametros #{reservacli_params.inspect} "
         #logger.debug"<< obtener descripcion de la caja de texto #{reservacli_params.descripcion} >>> " no funciona
         logger.debug"<< obtener descripcion de la caja de texto #{reservacli_params['descripcion']} >>> "
          logger.debug"<< user id #{current_user.id} >>"
        # id=current_user.id
        
        
         @reserva_cli = Reserva.new(reservacli_params.merge(user_id: current_user.id))
         @reserva_cli.save
         redirect_to reservacli_path
    end
    
    
    def edit
     
      @reserva_cli = Reserva.find( params[:id])
      if(@reserva_cli.aprobado==true)
       #flash[:notice] = 'La reserva ya fue revisada'
       redirect_to reservacli_path, flash: {notice: "La reserva ya fue revisada - no se puede editar"}
      end
      
    end
    def update
     
      @reserva_cli = Reserva.find(params[:id])
    
      
      if @reserva_cli.update_attributes(reservacli_params)
        # Handle a successful update.
        redirect_to reservacli_path
      else
        render 'edit'
      end
      
    end
    
    def destroy
      @reserva_cli = Reserva.find(params[:id])
      if(@reserva_cli.aprobado==true)
       #flash[:notice] = 'La reserva ya fue revisada'
       redirect_to reservacli_path, flash: {notice: "La reserva ya fue revisada - no se puede eliminar"}
      
      else
       @reserva_cli.destroy
      end
    end
    
    def validar_clie
       if(current_user!=nil)
         logger.debug "pasó"
       else
          redirect_to home_index_path   
       end
    end

    def mensaje 
      @mensaje
    end
    
    def reservacli_params
      params.require(:reserva).permit(:id,:sala_id,:user_id , :fe_reserva, :descripcion, :aprobado)
    end
end
