class Clase < ActiveRecord::Base
	has_many :muebles
	has_many :modelos, :through => :muebles
	validates :nombre, :presence=> {:message => "del mueble no puede estar en blanco"}
    validates :nombre, :uniqueness=> {:message => "del mueble no puede repetirse en la base de datos"}
end
