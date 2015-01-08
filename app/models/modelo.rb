class Modelo < ActiveRecord::Base
	 belongs_to :mueble
	 has_many :componentes, dependent: :destroy
     has_many :piezas, :through => :componentes
end
