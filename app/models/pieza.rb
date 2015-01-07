class Pieza < ActiveRecord::Base
	 has_many :componentes
     has_many :modelos, :through => :componentes
end
