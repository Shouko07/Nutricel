class InventariosController < ApplicationController
  before_action :set_inventario, only: %i[ show edit update destroy ]

  # GET /inventarios or /inventarios.json
  def index
    @inventarios = Inventario.all
  end

  # GET /inventarios/1 or /inventarios/1.json
  def show
  end

  # GET /inventarios/new
  def new
    @inventario = Inventario.new
  end

  # GET /inventarios/1/edit
  def edit
    @producto = @inventario.producto

    @inventario = Inventario.find(params[:id])
    @proveedor = @inventario.producto.proveedor
    
  end

  # POST /inventarios or /inventarios.json
  def create
    @inventario = Inventario.new(inventario_params)

    respond_to do |format|
      if @inventario.save
        format.html { redirect_to inventario_url(@inventario), notice: "Inventario was successfully created." }
        format.json { render :show, status: :created, location: @inventario }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @inventario.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /inventarios/1 or /inventarios/1.json
  def update
    respond_to do |format|
      # Obtenemos el valor actual de existencias
      existencias_actuales = @inventario.existencias
      # Sumamos las existencias actuales con el valor proporcionado por el usuario
      @inventario.existencias = existencias_actuales + inventario_params[:existencias].to_i
  
      if @inventario.save
        format.html { redirect_to proveedor_path(@inventario.producto.proveedor), notice: "El inventario fue actualizado exitosamente." }
        format.json { render :show, status: :ok, location: @inventario }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @inventario.errors, status: :unprocessable_entity }
      end
    end
  end
  
  

  # DELETE /inventarios/1 or /inventarios/1.json
  def destroy
    @inventario.destroy!

    respond_to do |format|
      format.html { redirect_to inventarios_url, notice: "Inventario was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_inventario
      @inventario = Inventario.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def inventario_params
      params.require(:inventario).permit(:inventario_id, :existencias, :producto_id)
    end
end
