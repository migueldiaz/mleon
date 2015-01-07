class Modelo < ActiveRecord::Base
	 has_many :componentes
     has_many :piezas, :through => :componentes
end
