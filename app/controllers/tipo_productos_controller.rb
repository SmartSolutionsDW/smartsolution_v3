class TipoProductosController < ApplicationController
  before_action :index, :validar_admin,:set_tipo_producto, only: [:show, :edit, :update, :destroy]

  # GET /tipo_productos
  # GET /tipo_productos.json
  def index
    self.validar_admin
    @tipo_productos = TipoProducto.all
  end

  # GET /tipo_productos/1
  # GET /tipo_productos/1.json
  def show
    self.validar_admin
  end

  # GET /tipo_productos/new
  def new
    self.validar_admin
    @tipo_producto = TipoProducto.new
  end

  # GET /tipo_productos/1/edit
  def edit
    self.validar_admin
  end

  # POST /tipo_productos
  # POST /tipo_productos.json
  def create
    self.validar_admin
    @tipo_producto = TipoProducto.new(tipo_producto_params)

    respond_to do |format|
      if @tipo_producto.save
        format.html { redirect_to @tipo_producto, notice: 'Tipo producto was successfully created.' }
        format.json { render :show, status: :created, location: @tipo_producto }
      else
        format.html { render :new }
        format.json { render json: @tipo_producto.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tipo_productos/1
  # PATCH/PUT /tipo_productos/1.json
  def update
    self.validar_admin
    respond_to do |format|
      if @tipo_producto.update(tipo_producto_params)
        format.html { redirect_to @tipo_producto, notice: 'Tipo producto was successfully updated.' }
        format.json { render :show, status: :ok, location: @tipo_producto }
      else
        format.html { render :edit }
        format.json { render json: @tipo_producto.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tipo_productos/1
  # DELETE /tipo_productos/1.json
  def destroy
    self.validar_admin
    @tipo_producto.destroy
    respond_to do |format|
      format.html { redirect_to tipo_productos_url, notice: 'Tipo producto was successfully destroyed.' }
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
    def set_tipo_producto
      @tipo_producto = TipoProducto.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tipo_producto_params
      params.require(:tipo_producto).permit(:name, :estado)
    end
end
