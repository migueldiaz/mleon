class ModelosController < ApplicationController
  before_action :set_modelo, only: [:show, :edit, :update, :destroy]

  # GET /modelos
  # GET /modelos.json
  def index
    if(params[:mueble_id])
       @mueble=Mueble.find(params[:mueble_id])
       @modelos = @mueble.modelos
    elsif params[:clase]
       @clase=Clase.find(params[:clase])
      @modelos=@clase.modelos
    else
      @modelos=Modelo.all
    end
  end

  # GET /modelos/1
  # GET /modelos/1.json
  def show
    @piezas=Pieza.where(:tipo!='Casco')
  end

  # GET /modelos/new
  def new
      if !params[:mueble_id].nil?
        @mueble=Mueble.find(params[:mueble_id])
        @modelo = @mueble.modelos.new
      else
        @modelo=Modelo.new
      end
  end

  # GET /modelos/1/edit
  def edit
    @modelo=Modelo.find(params[:id])
    @mueble=@modelo.mueble
  end

  # POST /modelos
  # POST /modelos.json
  def create
    @mueble=Mueble.find(params[:mueble_id])
    @modelo=@mueble.modelos.create(modelo_params)
     #   redirect_to modelo_path(@modelo)

    #@modelo = Modelo.new(modelo_params)

    respond_to do |format|
      if @modelo.save
        format.html { redirect_to @modelo, notice: 'Modelo was successfully created.' }
        format.json { render :show, status: :created, location: @modelo }
      else
        format.html { render :new }
        format.json { render json: @modelo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /modelos/1
  # PATCH/PUT /modelos/1.json
  def update
    respond_to do |format|
      if @modelo.update(modelo_params)
        format.html { redirect_to @modelo, notice: 'Modelo was successfully updated.' }
        format.json { render :show, status: :ok, location: @modelo }
      else
        format.html { render :edit }
        format.json { render json: @modelo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /modelos/1
  # DELETE /modelos/1.json
  def destroy
  
       @mueble=@modelo.mueble
       @modelo.destroy

      respond_to do |format|
         if(!@modelo.mueble.nil?)
        format.html { redirect_to mueble_modelos_path(@mueble), notice: 'Modelo was successfully destroyed.' }
      else
        format.html { redirect_to modelos_path, notice: 'Modelo was successfully destroyed.' }
      end
        format.json { head :no_content }
      end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_modelo
      @modelo = Modelo.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def modelo_params
      params.require(:modelo).permit(:nombre, :descripcion, :ancho, :alto, :fondo,:mueble_id,:codigo)
    end
end
