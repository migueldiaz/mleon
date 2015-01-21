module ApplicationHelper
	def totalpuertas(items)
    	coleccion=Componente.none
    	items.each do|total|
    		coleccion =coleccion + (total.dame_puertas)
  		end
  		return coleccion
  	end
  	def selector_estado(estado)
  		if estado=='Tomado'
  			return 'text-danger'
  		elsif estado=='En producción'
  			return 'text-warning'
  		else
  			return 'text-success'
  		end
  	end
end
