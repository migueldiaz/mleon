class Pedido < ActiveRecord::Base
  belongs_to :cliente
  has_many :items, dependent: :destroy
  has_many :modelos, :through => :items
end
