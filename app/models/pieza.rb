class Pieza < ActiveRecord::Base
	 has_many :componentes
     has_many :modelos, :through => :componentes
     has_many :muebles, :through => :componentes

  	validates :nombre, :presence=> {:message => "de la pieza no puede estar en blanco"}
  	validates :nombre, :uniqueness=> {:message => "de la pieza no puede repetirse en la base de datos"}
end
