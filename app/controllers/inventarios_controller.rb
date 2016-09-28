class InventariosController < ApplicationController
  before_action :index, :validar_admin,:set_inventario, only: [:show, :edit, :update, :destroy]

  # GET /inventarios
  # GET /inventarios.json
  def index
    self.validar_admin
    @inventarios = Inventario.all
  end

  # GET /inventarios/1
  # GET /inventarios/1.json
  def show
    self.validar_admin
  end

  # GET /inventarios/new
  def new
    self.validar_admin
    @inventario = Inventario.new
  end

  # GET /inventarios/1/edit
  def edit
    self.validar_admin
  end

  # POST /inventarios
  # POST /inventarios.json
  def create
    self.validar_admin
    @inventario = Inventario.new(inventario_params)

    respond_to do |format|
      if @inventario.save
        format.html { redirect_to @inventario, notice: 'Inventario was successfully created.' }
        format.json { render :show, status: :created, location: @inventario }
      else
        format.html { render :new }
        format.json { render json: @inventario.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /inventarios/1
  # PATCH/PUT /inventarios/1.json
  def update
    self.validar_admin
    respond_to do |format|
      if @inventario.update(inventario_params)
        format.html { redirect_to @inventario, notice: 'Inventario was successfully updated.' }
        format.json { render :show, status: :ok, location: @inventario }
      else
        format.html { render :edit }
        format.json { render json: @inventario.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /inventarios/1
  # DELETE /inventarios/1.json
  def destroy
    self.validar_admin
    @inventario.destroy
    respond_to do |format|
      format.html { redirect_to inventarios_url, notice: 'Inventario was successfully destroyed.' }
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
    def set_inventario
      @inventario = Inventario.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def inventario_params
      params.require(:inventario).permit(:local_id, :producto_id, :cant, :precio_compra, :precio_venta, :entrada_salida)
    end
end
