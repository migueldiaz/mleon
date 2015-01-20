class DesgloseController < ApplicationController
  def show

  	@pedido=Pedido.find(params[:id])

  	#User.joins(:posts).where("posts.created_at < ?", Time.now)
  	@cascos=Componente.none
  
  	#person.pets.select(:name) { |pet| pet.name =~ /oo/ }
  	
  	#@cascos=@pedido.items.first.componentes_mueble.group(:componentes)


  	@puertas=@pedido.componentes.where("tipo = 'PUERTA'")
  	@items=@pedido.items
  end
end
