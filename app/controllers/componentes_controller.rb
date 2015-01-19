class ComponentesController < ApplicationController
	def create
		if !params[:modelo_id].nil?
    		@modelo = Modelo.find(params[:modelo_id])
    		@componente = @modelo.componentes.create(componente_params)
        @componente.tipo=@componente.pieza.tipo
        @componente.save
    		redirect_to modelo_path(@modelo)
    	else
    		@mueble = Mueble.find(params[:mueble_id])
    		@componente = @mueble.componentes.create(componente_params)
         @componente.tipo=@componente.pieza.tipo
        @componente.save
    		redirect_to mueble_path(@mueble)
    	end
  end

  def destroy
    if params[:mueble_id].present?
      @mueble = Mueble.find(params[:mueble_id])
      @componente = @mueble.componentes.find(params[:id])
      @componente.destroy
      redirect_to mueble_path(@mueble)
    else
      @modelo = Modelo.find(params[:modelo_id])
      @componente = @modelo.componentes.find(params[:id])
      @componente.destroy
      redirect_to modelo_path(@modelo)
    end
  end
 
  private
    def componente_params
      params.require(:componente).permit(:modelo_id, :pieza_id,:cantidad,:mueble_id)
    end
end

