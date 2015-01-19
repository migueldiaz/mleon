class DesgloseController < ApplicationController
  def show

  	@pedido=Pedido.find(params[:id])

  	@muebles=@pedido.muebles

  	@mobiliario=@pedido.items.first.componentes_mueble
  	@cascos= Componente.joins(:mueble).where("tipo = 'CASCO'")#.where(:tipo=>'CASCO')
  	@puertas=@pedido.componentes.where("tipo = 'PUERTA'")
  	@herrajes=@pedido.componentes.where("tipo = 'HERRAJE'")
  end
end
