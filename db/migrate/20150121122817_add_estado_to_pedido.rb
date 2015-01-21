class AddEstadoToPedido < ActiveRecord::Migration
  def change
    add_column :pedidos, :estado, :string
  end
end
