class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  autocomplete :modelo, :nombre,:full => true
  # GET /items
  # GET /items.json
  def index
    @items = Item.all
  end

  # GET /items/1
  # GET /items/1.json
  def show
    @pedido=@item.pedido
  end

  # GET /items/new
  def new
    @pedido=Pedido.find(params[:pedido_id])
    @item = @pedido.items.new
  end

  # GET /items/1/edit
  def edit
    if params[:id] 
      @item=Item.find(params[:id])
    end  
    @pedido=@item.pedido
  end

  # POST /items
  # POST /items.json
  def create
    @item = Item.new(item_params)
    @modelo=@item.modelo
    @pedmodelo=Pedmodelo.new
    @pedmodelo.codigo=@modelo.codigo
    @pedmodelo.nombre=@modelo.nombre
    @pedmodelo.alto =@modelo.mueble.alto
    @pedmodelo.ancho =@modelo.mueble.ancho
    @pedmodelo.fondo =@modelo.mueble.fondo
    @pedmodelo.descripcion =@modelo.descripcion
    respond_to do |format|
      if @item.save
         @pedmodelo.save
        format.html { redirect_to @item.pedido, notice: 'Item was successfully created.' }
        format.json { render :show, status: :created, location: @item.pedido }
      else
        format.html { render :new }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /items/1
  # PATCH/PUT /items/1.json
  def update
    respond_to do |format|
      if @item.update(item_params)
        format.html { redirect_to @item.pedido, notice: 'Item was successfully updated.' }
        format.json { render :show, status: :ok, location: @item.pedido }
      else
        format.html { render :edit }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /items/1
  # DELETE /items/1.json
  def destroy
    @pedido=@item.pedido
    @item.destroy
    respond_to do |format|
      format.html { redirect_to @pedido, notice: 'Se ha eliminado el item del pedido' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_item
      @item = Item.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def item_params
      params.require(:item).permit(:pedido_id, :modelo_id, :cantidad)
    end
end
