class ReservaClienteController < ApplicationController
    before_action :validar_clie
    
    def reservacli
        logger.debug"<<<< REserva de Cliente #{ current_user.inspect}<<<<"
        self.validar_clie
        
        @reserva_cli=Reserva.where(user_id: current_user.id)
        
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
         @reserva_cli = Reserva.new(reservacli_params)
          
         respond_to do |format|
             logger.debug"<create 1>"
             byebug 
              if @reserva_cli.save
                  byebug 
                 logger.debug"<create 1>"
                format.html { redirect_to reserva_cli_path, notice: 'Se envio su solicitud de reserva.' }
                format.json { render :reservacli, status: :created, location: @reserva_cli }
              else
                logger.debug"<create 2>"
                format.html { render :new }
                format.json { render json: @reserva_cli.errors, status: :unprocessable_entity }
              end
          end
    end
    
    def validar_clie
       if(current_user!=nil)
         logger.debug "pasó"
       else
          redirect_to home_index_path   
       end
    end

    def reservacli_params
      params.require(:reserva).permit(:sala_id, :user_id, :fe_reserva, :descripcion)
    end
end
