class AddFechaToPedidos < ActiveRecord::Migration
  def change
    add_column :pedidos, :fecha, :string
  end
end
