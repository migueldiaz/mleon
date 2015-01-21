class Cliente < ActiveRecord::Base
	has_many :pedidos

	validates :nombre, :presence=> {:message => "no puede estar en blanco"}
  	validates :CIF, :presence=> {:message => "del cliente no puede estar en blanco"}
    validates :CIF, :uniqueness=> {:message => "del cliente no puede repetirse en la base de datos"}
end
