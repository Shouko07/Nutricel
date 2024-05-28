class PedidosController < ApplicationController
  before_action :set_pedido, only: %i[show edit update destroy ]
  before_action :authenticate_usuario!
  before_action :correct_user, only: [:edit, :update, :destroy]
  
  # GET /pedidos or /pedidos.json
  def index
    @usuarios = Usuario.all

    @pedidos = current_usuario.pedido.order(:id) # Ordena los pedidos por ID
    @pedi2 = Pedido.where(usuario: current_usuario)
    @total_sum = @pedi2.sum do |pedido|
      if pedido.producto && pedido.producto.precio
        pedido.cantidad_ordenada * pedido.producto.precio
      else
        0
      end
    end
    
  end

  # GET /pedidos/1 or /pedidos/1.json
  def show
    @usuarios = Usuario.all

    @proveedors= Proveedor.all
  end

  # GET /pedidos/new
  def new
    @pedidos = current_usuario.pedido.order(:id) # Ordena los pedidos por ID
    @pedido = current_usuario.pedido.build
    
    @producto = Producto.find(params[:producto_id])
    @pedido.producto = @producto


    @next_pedido_id = current_usuario.pedido.maximum(:pedido_id).to_i + 1
  end
  


  # GET /pedidos/1/edit
  def edit
    @pedido
  end

  # POST /pedidos or /pedidos.json
  def create
    #@pedido = Pedido.new(pedido_params)
    @pedido = current_usuario.pedido.build(pedido_params)
    @pedidos = Pedido.where(usuario: current_usuario)

    respond_to do |format|
      if @pedido.save
        producto = @pedido.producto
        inventario = producto.inventario
        inventario.update(existencias: inventario.existencias - @pedido.cantidad_ordenada)
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
    @pedido = Pedido.find(params[:id])
    cantidad_anterior = @pedido.cantidad_ordenada
    # Obtener el producto y el inventario
    producto = @pedido.producto
    inventario = producto.inventario

    inventario.update(existencias: inventario.existencias + cantidad_anterior)
    respond_to do |format|
      if @pedido.update(pedido_params)

  
        # Ajustar el inventario sumando la cantidad anterior y restando la nueva cantidad
        inventario.update(existencias: inventario.existencias - @pedido.cantidad_ordenada)


  
        format.html { redirect_to pedido_url(@pedido), notice: "Pedido was successfully updated." }
        format.json { render :show, status: :ok, location: @pedido }
      else
        inventario.update(existencias: inventario.existencias - cantidad_anterior)
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @pedido.errors, status: :unprocessable_entity }
      end
    end
  end
  

  # DELETE /pedidos/1 or /pedidos/1.json
  def destroy
    producto_id_eliminado = @pedido.producto_id
    @pedido.destroy!

    respond_to do |format|
      producto = @pedido.producto
      inventario = producto.inventario
      inventario.update(existencias: inventario.existencias + @pedido.cantidad_ordenada)
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
      params.require(:pedido).permit(:cantidad_ordenada, :fecha_inicial, :fecha_entrega, :usuario_id, :producto_id, :pedido_id)
    end
    def correct_user
      @pedido = current_usuario.pedido.find_by(id: params[:id])
      redirect_to pedidos_path, notice: "No disponible" if @pedido.nil?
    end
end
