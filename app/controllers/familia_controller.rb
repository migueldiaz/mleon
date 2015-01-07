class FamiliaController < ApplicationController
  before_action :set_familium, only: [:show, :edit, :update, :destroy]

  # GET /familia
  # GET /familia.json
  def index
    @familia = Familium.all
  end

  # GET /familia/1
  # GET /familia/1.json
  def show
  end

  # GET /familia/new
  def new
    @familium = Familium.new
  end

  # GET /familia/1/edit
  def edit
  end

  # POST /familia
  # POST /familia.json
  def create
    @familium = Familium.new(familium_params)

    respond_to do |format|
      if @familium.save
        format.html { redirect_to @familium, notice: 'Familium was successfully created.' }
        format.json { render :show, status: :created, location: @familium }
      else
        format.html { render :new }
        format.json { render json: @familium.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /familia/1
  # PATCH/PUT /familia/1.json
  def update
    respond_to do |format|
      if @familium.update(familium_params)
        format.html { redirect_to @familium, notice: 'Familium was successfully updated.' }
        format.json { render :show, status: :ok, location: @familium }
      else
        format.html { render :edit }
        format.json { render json: @familium.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /familia/1
  # DELETE /familia/1.json
  def destroy
    @familium.destroy
    respond_to do |format|
      format.html { redirect_to familia_url, notice: 'Familium was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_familium
      @familium = Familium.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def familium_params
      params.require(:familium).permit(:nombre, :descripcion)
    end
end
