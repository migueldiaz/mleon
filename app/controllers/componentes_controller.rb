class ComponentesController < ApplicationController
	def create
    @modelo = Modelo.find(params[:modelo_id])
    @componente = @modelo.componentes.create(componente_params)
    redirect_to modelo_path(@modelo)
  end
 
  private
    def componente_params
      params.require(:componente).permit(:modelo_id, :pieza_id,:cantidad)
    end
end

