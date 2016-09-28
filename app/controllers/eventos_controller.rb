class EventosController < ApplicationController
  before_action :index, :validar_admin, :set_evento, only: [:show, :edit, :update, :destroy]

  # GET /eventos
  # GET /eventos.json
  def index
    self.validar_admin
    @eventos = Evento.all
  end

  # GET /eventos/1
  # GET /eventos/1.json
  def show
    self.validar_admin
  end

  # GET /eventos/new
  def new
    self.validar_admin
    @evento = Evento.new
  end

  # GET /eventos/1/edit
  def edit
    self.validar_admin
  end

  # POST /eventos
  # POST /eventos.json
  def create
    self.validar_admin
    @evento = Evento.new(evento_params)

    respond_to do |format|
      if @evento.save
        format.html { redirect_to @evento, notice: 'Evento was successfully created.' }
        format.json { render :show, status: :created, location: @evento }
      else
        format.html { render :new }
        format.json { render json: @evento.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /eventos/1
  # PATCH/PUT /eventos/1.json
  def update
    self.validar_admin
    respond_to do |format|
      if @evento.update(evento_params)
        format.html { redirect_to @evento, notice: 'Evento was successfully updated.' }
        format.json { render :show, status: :ok, location: @evento }
      else
        format.html { render :edit }
        format.json { render json: @evento.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /eventos/1
  # DELETE /eventos/1.json
  def destroy
    self.validar_admin
    @evento.destroy
    respond_to do |format|
      format.html { redirect_to eventos_url, notice: 'Evento was successfully destroyed.' }
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
    def set_evento
      @evento = Evento.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def evento_params
      params.require(:evento).permit(:local_id, :fe_evento, :capacidad, :descripcion)
    end
end
