class Pedido < ActiveRecord::Base
  belongs_to :cliente
  has_many :items, dependent: :destroy
  has_many :modelos, :through => :items
  has_many :piezas, :through => :modelos

  has_many :muebles, :through => :modelos
  has_many :componentes, :through => :modelos
 
  #-------------------------------------
  def dame_puertas_pedido
    componentes_puerta=Componente.none
       self.items.each do |item|
    componentes_puerta = componentes_puerta + item.modelo.componentes.where(:tipo=>'Puerta')
    end
    return componentes_puerta
  end
  def dame_puertas_unicas
    return self.dame_puertas_pedido.uniq{|x| x.pieza_id}
  end
  def total_puertas(pieza)
      suma=0
      self.dame_puertas_pedido.each do |componente|
        if componente.pieza==pieza
          suma=suma+componente.cantidad
        end
      end
      return suma;
  end

  #-------------------------------------
  def dame_herrajes_pedido
    componentes_herraje=Componente.none
       self.items.each do |item|
    componentes_herraje = componentes_herraje + item.modelo.componentes.where(:tipo=>'Herraje')
    end
    return componentes_herraje
  end
  def dame_herrajes_unicas
    return self.dame_herrajes_pedido.uniq{|x| x.pieza_id}
  end
  def total_herrajes(pieza)
      suma=0
      self.dame_herrajes_pedido.each do |componente|
        if componente.pieza==pieza
          suma=suma+componente.cantidad
        end
      end
      return suma;
  end


  #-----------------------------------
  def componentes_mueble
    componentes_mueble=Componente.none
    self.items.each do |item|
    componentes_mueble = componentes_mueble + item.modelo.mueble.componentes
    end
    return componentes_mueble
  end
  #-------------------------------------
  def componentes_mueble_unicos
    
  	return self.componentes_mueble.uniq{|x| x.pieza_id}
  end
  #------------------------------------------
  def total_pieza(pieza)
      suma=0
      self.componentes_mueble.each do |componente|
        if componente.pieza==pieza
          suma=suma+componente.cantidad
        end
      end
      return suma;
  end
  #----------------------------------------------
end
