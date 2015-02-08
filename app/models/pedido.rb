class Pedido < ActiveRecord::Base
  belongs_to :cliente
  has_many :items, dependent: :destroy
  has_many :modelos, :through => :items
  has_many :piezas, :through => :modelos

  has_many :muebles, :through => :modelos
  has_many :componentes, :through => :modelos
 

  validates :cliente_id, :presence=> {:message => "no puede estar en blanco"}
  
  
  #-------------


  #-------------------------------------
  def dame_puertas_pedido
    componentes_puerta=Componente.none
       self.items.each do |item|
    componentes_puerta = componentes_puerta + item.modelo.componentes.where(:tipo=>'Puerta')
    end
    return componentes_puerta
  end
  def dame_puertas_unicas
    return self.dame_puertas_pedido.uniq{|x| x.pieza_id}.sort {|a,b| b.pieza.nombre <=> a.pieza.nombre }
  end


  def dame_multiplicador(nombre_pieza)
    total=0
    self.items.each do |item|
      if item.modelo.componentes.where(:nombre=>nombre_pieza)
        total=total+item.cantidad
      end
    end
    return total
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
    return self.dame_herrajes_pedido.uniq{|x| x.pieza_id}.sort {|a,b| b.pieza.nombre <=> a.pieza.nombre }
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
    @componentes=self.componentes_mueble.uniq{|x| x.pieza_id}
    @componentes.sort {|a,b| b.pieza.nombre <=> a.pieza.nombre }
  	return @componentes
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
  def total_cascos(pieza)
    total=0

    self.items.each do |item|
       item.componentes_mueble.each do |componente|
            if pieza.id==componente.pieza.id
              total= total + item.cantidad * componente.cantidad
            end
        end
    end

    return total
  end

 #---------------------------------------------------------
 def total_para_modelos(pieza)
    total=0

    self.items.each do |item|
       item.modelo.componentes.each do |componente|
            if pieza==componente.pieza
              total= total + item.cantidad * componente.cantidad
            end
        end
    end

    return total
  end





 #------------------------------------------------
 end