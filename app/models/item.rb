class Item < ActiveRecord::Base
  belongs_to :pedido
  belongs_to :modelo
  #autocomplete :modelo, :nombre
  def componentes_mueble
  	return self.modelo.mueble.componentes
  end
  def componentes_modelo
  	return self.modelo.componentes
  end
  ## en componente necesito multiplicar el modelo * la pieza 
  ## en el total necesito multiplicar la cantidad de items por el modelo
  ## Un join ?????
end
