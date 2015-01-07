class MueblesController < ApplicationController
  before_action :set_mueble, only: [:show, :edit, :update, :destroy]

  # GET /muebles
  # GET /muebles.json
  def index
    @muebles = Mueble.all
  end

  # GET /muebles/1
  # GET /muebles/1.json
  def show
  end

  # GET /muebles/new
  def new
    @mueble = Mueble.new
  end

  # GET /muebles/1/edit
  def edit
  end

  # POST /muebles
  # POST /muebles.json
  def create
    @mueble = Mueble.new(mueble_params)

    respond_to do |format|
      if @mueble.save
        format.html { redirect_to @mueble, notice: 'Mueble was successfully created.' }
        format.json { render :show, status: :created, location: @mueble }
      else
        format.html { render :new }
        format.json { render json: @mueble.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /muebles/1
  # PATCH/PUT /muebles/1.json
  def update
    respond_to do |format|
      if @mueble.update(mueble_params)
        format.html { redirect_to @mueble, notice: 'Mueble was successfully updated.' }
        format.json { render :show, status: :ok, location: @mueble }
      else
        format.html { render :edit }
        format.json { render json: @mueble.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /muebles/1
  # DELETE /muebles/1.json
  def destroy
    @mueble.destroy
    respond_to do |format|
      format.html { redirect_to muebles_url, notice: 'Mueble was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_mueble
      @mueble = Mueble.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def mueble_params
      params.require(:mueble).permit(:nombre, :descripcion, :ancho, :alto, :fondo, :clase_id)
    end
end
