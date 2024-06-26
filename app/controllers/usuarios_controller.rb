class UsuariosController < ApplicationController
  before_action :set_usuario, only: %i[ show update destroy ]
  before_action :authenticate_usuario!
  before_action :correct_user, only: [ :update, :destroy]
  # GET /usuarios or /usuarios.json
  def index
    @usuarios = Usuario.all
  end

  # GET /usuarios/1 or /usuarios/1.json
  def show
  end

  # GET /usuarios/new
  def new
    @usuario = current_usuario.usuario.build
  end

  # POST /usuarios or /usuarios.json
  def create
    @usuario = current_usuario.usuario.build(usuario_params)

    respond_to do |format|
      if @usuario.save
        format.html { redirect_to usuario_url(@usuario), notice: "usuario was successfully created." }
        format.json { render :show, status: :created, location: @usuario }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @usuario.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /usuarios/1 or /usuarios/1.json
  def update
    respond_to do |format|
      if @usuario.update(usuario_params)
        format.html { redirect_to usuario_url(@usuario), notice: "usuario was successfully updated." }
        format.json { render :show, status: :ok, location: @usuario }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @usuario.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /usuarios/1 or /usuarios/1.json
  def destroy
    @usuario.destroy!

    respond_to do |format|
      format.html { redirect_to usuarios_url, notice: "usuario was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_usuario
      @usuario = Usuario.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def usuario_params
      params.require(:usuario).permit(:email, :nombre, :apellido_paterno, :apellido_materno, :telefono, :calle, :colonia, :codigo_postal, :ciudad, :pais)
    end
end
