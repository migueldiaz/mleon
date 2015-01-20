class Pedido < ActiveRecord::Base
  belongs_to :cliente
  has_many :items, dependent: :destroy
  has_many :modelos, :through => :items
  has_many :piezas, :through => :modelos

  has_many :muebles, :through => :modelos
  has_many :componentes, :through => :modelos

 # def componentes_mueble
 
  #	self.items.each do |item|
  #		componentes_mueble << item.componentes_mueble
  #	end
  #	retun componentes_mueble
  #end
end
