class Componente < ActiveRecord::Base
  belongs_to :modelo
  belongs_to :pieza
  belongs_to :mueble
end
