class Mueble < ActiveRecord::Base
  belongs_to :clase
  has_many :componentes, dependent: :destroy
  has_many :modelos, dependent: :destroy
  has_many :piezas, :through => :componentes

  validates :nombre, presence: true,length: { minimum: 4}
  validates :clase, presence: true
end
