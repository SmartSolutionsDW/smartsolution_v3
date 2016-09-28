class AdministratorLocalsController < ApplicationController
  before_action :set_administrator_local, only: [:show, :edit, :update, :destroy]

  # GET /administrator_locals
  # GET /administrator_locals.json
  def index
    @administrator_locals = AdministratorLocal.all
  end

  # GET /administrator_locals/1
  # GET /administrator_locals/1.json
  def show
  end

  # GET /administrator_locals/new
  def new
    @administrator_local = AdministratorLocal.new
  end

  # GET /administrator_locals/1/edit
  def edit
  end

  # POST /administrator_locals
  # POST /administrator_locals.json
  def create
    @administrator_local = AdministratorLocal.new(administrator_local_params)

    respond_to do |format|
      if @administrator_local.save
        format.html { redirect_to @administrator_local, notice: 'Administrator local was successfully created.' }
        format.json { render :show, status: :created, location: @administrator_local }
      else
        format.html { render :new }
        format.json { render json: @administrator_local.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /administrator_locals/1
  # PATCH/PUT /administrator_locals/1.json
  def update
    respond_to do |format|
      if @administrator_local.update(administrator_local_params)
        format.html { redirect_to @administrator_local, notice: 'Administrator local was successfully updated.' }
        format.json { render :show, status: :ok, location: @administrator_local }
      else
        format.html { render :edit }
        format.json { render json: @administrator_local.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /administrator_locals/1
  # DELETE /administrator_locals/1.json
  def destroy
    @administrator_local.destroy
    respond_to do |format|
      format.html { redirect_to administrator_locals_url, notice: 'Administrator local was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_administrator_local
      @administrator_local = AdministratorLocal.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def administrator_local_params
      params.require(:administrator_local).permit(:employee_id, :local_id, :estado)
    end
end
