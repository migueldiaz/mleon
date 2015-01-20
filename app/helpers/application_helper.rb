module ApplicationHelper
	def totalpuertas(items)
    	coleccion=Componente.none
    	items.each do|total|
    		coleccion =coleccion + (total.dame_puertas)
  		end
  		return coleccion
  	end
end
