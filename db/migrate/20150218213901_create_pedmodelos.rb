class CreatePedmodelos < ActiveRecord::Migration
  def change
    create_table :pedmodelos do |t|
      t.string :codigo
      t.string :nombre
      t.integer :alto
      t.integer :ancho
      t.integer :fondo
      t.text :descripcion
      t.references :modelo, index: true

      t.timestamps null: false
    end
    add_foreign_key :pedmodelos, :modelos
  end
end
