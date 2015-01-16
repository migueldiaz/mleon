class Modelo < ActiveRecord::Base
	 belongs_to :mueble
	 has_many :componentes, dependent: :destroy
     has_many :piezas, :through => :componentes
     belongs_to :clase

     validates :nombre, :presence=> {:message => "del modelo no puede estar en blanco"}
     validates :mueble, :presence=> {:message => "base del modelo no puede estar en blanco"}
     validates :codigo, :uniqueness=> {:message => "no puede repetirse en la base de datos"}
     validates :codigo, :presence => {:message => "no puede estar en blanco, asigna un código al modelo"}
end
