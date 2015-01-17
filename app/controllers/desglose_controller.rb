class DesgloseController < ApplicationController
  def show
  	@pedido=Pedido.find(params[:id])
  	@cascos= @pedido.componentes.where("componente.pieza.tipo = 'CASCO'")#.where(:tipo=>'CASCO')
  	@puertas=@pedido.piezas.where(:tipo=>'PUERTA')
  	@herrajes=@pedido.piezas.where(:tipo=>'HERRAJE')
  end
end
