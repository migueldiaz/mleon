class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.references :pedido, index: true
      t.references :modelo, index: true
      t.integer :cantidad

      t.timestamps null: false
    end
    add_foreign_key :items, :pedidos
    add_foreign_key :items, :modelos
  end
end
