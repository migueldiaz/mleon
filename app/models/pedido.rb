class Pedido < ActiveRecord::Base
  belongs_to :cliente
  has_many :items, dependent: :destroy
  has_many :modelos, :through => :items
  has_many :piezas, :through => :modelos
  has_many :componentes, :through => :modelos
  has_many :muebles, :through => :modelos
end
