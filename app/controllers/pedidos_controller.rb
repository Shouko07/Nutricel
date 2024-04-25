class PedidosController < ApplicationController
  before_action :set_pedido, only: %i[show edit update destroy ]
  before_action :authenticate_usuario!
  before_action :correct_user, only: [:edit, :update, :destroy]
  
  # GET /pedidos or /pedidos.json
  def index
    @pedidos = Pedido.all
  end

  # GET /pedidos/1 or /pedidos/1.json
  def show
  end

  # GET /pedidos/new
  def new
    @pedido = current_usuario.pedido.build
    @producto = Producto.find(params[:producto_id])
    @pedido.producto = @producto
  end
  

  # GET /pedidos/1/edit
  def edit
  end

  # POST /pedidos or /pedidos.json
  def create
    #@pedido = Pedido.new(pedido_params)
    @pedido = current_usuario.pedido.build(pedido_params)
    respond_to do |format|
      if @pedido.save
        format.html { redirect_to pedido_url(@pedido), notice: "Pedido was successfully created." }
        format.json { render :show, status: :created, location: @pedido }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @pedido.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pedidos/1 or /pedidos/1.json
  def update
    respond_to do |format|
      if @pedido.update(pedido_params)
        format.html { redirect_to pedido_url(@pedido), notice: "Pedido was successfully updated." }
        format.json { render :show, status: :ok, location: @pedido }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @pedido.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pedidos/1 or /pedidos/1.json
  def destroy
    @pedido.destroy!

    respond_to do |format|
      format.html { redirect_to pedidos_url, notice: "Pedido was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pedido
      @pedido = Pedido.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def pedido_params
      params.require(:pedido).permit(:cantidad_ordenada, :fecha_inicial, :fecha_entrega, :usuario_id, :producto_id)
    end
    def correct_user
      @pedido = current_usuario.pedido.find_by(id: params[:id])
      redirect_to pedidos_path, notice: "No disponible" if @pedido.nil?
    end
end
