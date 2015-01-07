class Mueble < ActiveRecord::Base
  belongs_to :clase
  has_many :componentes
  has_many :modelos
  has_many :piezas, :through => :componentes
end
