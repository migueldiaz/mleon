class CreateComponentes < ActiveRecord::Migration
  def change
    create_table :componentes do |t|
      t.references :modelo, index: true
      t.references :pieza, index: true
      t.integer :cantidad

      t.timestamps null: false
    end
    add_foreign_key :componentes, :modelos
    add_foreign_key :componentes, :piezas
  end
end
