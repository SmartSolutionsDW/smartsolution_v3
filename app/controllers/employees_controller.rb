class EmployeesController < ApplicationController
  before_action :index, :validar_admin,:set_employee, only: [:show, :edit, :update, :destroy] 
  
  # GET /employees
  # GET /employees.json
  def index
    self.validar_admin
    @employee = Employee.all
  end

  # GET /employees/1
  # GET /employees/1.json
  def show
    self.validar_admin
  end

  # GET /employees/new
  def new
    self.validar_admin
    @employee = Employee.new
  end

  # GET /employees/1/edit
  def edit
    self.validar_admin
  end

  # POST /employees
  # POST /employees.json
  def create
    self.validar_admin
    @employee = Employee.new(employee_params)

    respond_to do |format|
      if @employee.save
        format.html { redirect_to @employee, notice: 'Employee was successfully created.' }
        format.json { render :show, status: :created, location: @employee }
      else
        format.html { render :new }
        format.json { render json: @employee.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /employees/1
  # PATCH/PUT /employees/1.json
  def update
    self.validar_admin
    respond_to do |format|
      if @employee.update(employee_params)
        format.html { redirect_to @employee, notice: 'Employee was successfully updated.' }
        format.json { render :show, status: :ok, location: @employee }
      else
        format.html { render :edit }
        format.json { render json: @employee.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /employees/1
  # DELETE /employees/1.json
  def destroy
    self.validar_admin
    #@employee.destroy
    logger.debug "<<<<< eliminando empleado >>>>>"
    if(@employee['id']!=6)
      @employee.destroy
      respond_to do |format|
        format.html { redirect_to employees_url, notice: 'Employee was successfully destroyed.' }
        format.json { head :no_content }
      end
    else
        respond_to do |format|
          format.html { redirect_to employees_url, alert: 'El empleado no va ser eliminado porque es el administrador.' }
          
          format.json { render json: "sere", status: :unprocessable_entity }
        end
      
    end
  
    
  end


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
    def set_employee
      @employee = Employee.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def employee_params
      params.require(:employee).permit(:nombre, :apellido, :dni, :correo, :password, :admin)
    end
    
   
end
