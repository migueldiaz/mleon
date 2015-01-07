class Componente < ActiveRecord::Base
  belongs_to :modelo
  belongs_to :pieza
end
