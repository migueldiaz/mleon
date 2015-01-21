class Mueble < ActiveRecord::Base
  belongs_to :clase
  has_many :componentes, dependent: :destroy
  has_many :modelos, dependent: :destroy
  has_many :piezas, :through => :componentes

  
  validates :clase, :presence => {:message => " del modelo no puede estar en blanco"}
  validates :nombre, :presence=> {:message => "del mueble no puede estar en blanco"}
  validates :nombre, :uniqueness=> {:message => "del mueble no puede repetirse en la base de datos"}
    
end
