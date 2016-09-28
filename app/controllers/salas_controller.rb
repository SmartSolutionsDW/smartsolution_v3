class SalasController < ApplicationController
  
  before_action :index, :validar_admin, :set_sala, only: [:show, :edit, :update, :destroy]

  # GET /salas
  # GET /salas.json
  def index
    self.validar_admin
    @salas = Sala.all
    logger.debug "<<<<< Index sala #{@salas} >>>>> "
  end
  logger.debug "<<<<< SALA >>>>> "
 
  # GET /salas/1
  # GET /salas/1.json
  def show
    self.validar_admin
  end

  # GET /salas/new
  def new
    self.validar_admin
    @sala = Sala.new
     logger.debug "<<<<< NEW sala #{@sala.inspect} >>>>> "
  
  end

  # GET /salas/1/edit
  def edit
    self.validar_admin
  end

  # POST /salas
  # POST /salas.json
  def create
    self.validar_admin
    @sala = Sala.new(sala_params)

    respond_to do |format|
      if @sala.save
        format.html { redirect_to @sala, notice: 'Sala was successfully created.' }
        format.json { render :show, status: :created, location: @sala }
      else
        format.html { render :new }
        format.json { render json: @sala.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /salas/1
  # PATCH/PUT /salas/1.json
  def update
    self.validar_admin
    respond_to do |format|
      if @sala.update(sala_params)
        format.html { redirect_to @sala, notice: 'Sala was successfully updated.' }
        format.json { render :show, status: :ok, location: @sala }
      else
        format.html { render :edit }
        format.json { render json: @sala.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /salas/1
  # DELETE /salas/1.json
  def destroy
    self.validar_admin
    @sala.destroy
    respond_to do |format|
      format.html { redirect_to salas_url, notice: 'Sala was successfully destroyed.' }
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
    def set_sala
      @sala = Sala.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sala_params
      params.require(:sala).permit(:local_id, :no_sala, :qt_capacidad, :descripcion)
       
      
    
    end
end
