class Modelo < ActiveRecord::Base
	 belongs_to :mueble
	 has_many :componentes
     has_many :piezas, :through => :componentes
end
