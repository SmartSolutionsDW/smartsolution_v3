class ReservasController < ApplicationController
  before_action :index, :validar_admin,:set_reserva, only: [:show, :edit, :update, :destroy]

  # GET /reservas
  # GET /reservas.json
  def index
     self.validar_admin
    @reservas = Reserva.all
  end

  # GET /reservas/1
  # GET /reservas/1.json
  def show
     self.validar_admin
  end

  # GET /reservas/new
  def new
     self.validar_admin
    @reserva = Reserva.new
  end

  # GET /reservas/1/edit
  def edit
     self.validar_admin
  end

  # POST /reservas
  # POST /reservas.json
  def create
     self.validar_admin
    @reserva = Reserva.new(reserva_params)

    respond_to do |format|
      if @reserva.save
        format.html { redirect_to @reserva, notice: 'Reserva was successfully created.' }
        format.json { render :show, status: :created, location: @reserva }
      else
        format.html { render :new }
        format.json { render json: @reserva.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /reservas/1
  # PATCH/PUT /reservas/1.json
  def update
     self.validar_admin
    respond_to do |format|
      if @reserva.update(reserva_params)
        format.html { redirect_to @reserva, notice: 'Reserva was successfully updated.' }
        format.json { render :show, status: :ok, location: @reserva }
      else
        format.html { render :edit }
        format.json { render json: @reserva.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reservas/1
  # DELETE /reservas/1.json
  def destroy
     self.validar_admin
    @reserva.destroy
    respond_to do |format|
      format.html { redirect_to reservas_url, notice: 'Reserva was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  #validamos , porque solo los empleados y administrador pueden crear local
   def validar_admin
      
       
       logger.debug "<<<<< validar sesion en empleados #{session[:intranet].inspect}>>>>>" 
       if(session[:intranet]!=nil)
         
         @employees=session[:intranet]
          if(session[:intranet]['admin']==false)
            redirect_to intranet_path
          end
       else
          redirect_to intranet_path   
       end
      
   end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_reserva
      @reserva = Reserva.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def reserva_params
      params.require(:reserva).permit(:sala_id, :user_id, :fe_reserva, :descripcion, :estado, :aprobado)
    end
end
