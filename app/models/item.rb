class Item < ActiveRecord::Base
  belongs_to :pedido
  belongs_to :modelo

  validates :modelo_id, :presence=> {:message => "no puede estar en blanco"}
  validates :cantidad, :presence=> {:message => "debe ser un valor numérico"}
  #autocomplete :modelo, :nombre
  
  def dame_cascos
     return self.modelo.mueble.componentes#.where(tipo: 'Herraje')
  end
  def dame_puertas
     return self.modelo.componentes.where(tipo: 'Puerta')
  end
  def dame_herrajes
    return self.modelo.componentes.where(tipo: 'Herraje')
  end


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
