class CreatePedidos < ActiveRecord::Migration
  def change
    create_table :pedidos do |t|
      t.references :cliente, index: true

      t.timestamps null: false
    end
    add_foreign_key :pedidos, :clientes
  end
end
