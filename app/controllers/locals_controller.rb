class LocalsController < ApplicationController
  
  before_action :index, :validar_admin,:set_local, only: [:show, :edit, :update, :destroy]
  
  # GET /locals
  # GET /locals.json
  def index
    self.validar_admin
    @locals = Local.all
  end

  # GET /locals/1
  # GET /locals/1.json
  def show
     self.validar_admin
  end

  # GET /locals/new
  def new
     self.validar_admin
    @local = Local.new
  end

  # GET /locals/1/edit
  def edit
    self.validar_admin
  end

  # POST /locals
  # POST /locals.json
  def create
    self.validar_admin
    @local = Local.new(local_params)

    respond_to do |format|
      if @local.save
        format.html { redirect_to @local, notice: 'Local was successfully created.' }
        format.json { render :show, status: :created, location: @local }
      else
        format.html { render :new }
        format.json { render json: @local.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /locals/1
  # PATCH/PUT /locals/1.json
  def update
    self.validar_admin
    respond_to do |format|
      if @local.update(local_params)
        format.html { redirect_to @local, notice: 'Local was successfully updated.' }
        format.json { render :show, status: :ok, location: @local }
      else
        format.html { render :edit }
        format.json { render json: @local.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /locals/1
  # DELETE /locals/1.json
  def destroy
    self.validar_admin
    @local.destroy
    respond_to do |format|
      format.html { redirect_to locals_url, notice: 'Local was successfully destroyed.' }
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
    def set_local
      @local = Local.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def local_params
      params.require(:local).permit(:No_Local, :No_Direccion, :Nu_Telefono, :Tx_Correo)
    end
end
