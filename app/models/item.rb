class Item < ActiveRecord::Base
  belongs_to :pedido
  belongs_to :modelo, dependent: :destroy
  
end
