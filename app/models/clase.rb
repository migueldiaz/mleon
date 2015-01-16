class Clase < ActiveRecord::Base
	has_many :muebles
	has_many :modelos, :through => :muebles
end
