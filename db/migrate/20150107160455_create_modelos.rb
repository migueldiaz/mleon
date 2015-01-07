class CreateModelos < ActiveRecord::Migration
  def change
    create_table :modelos do |t|
      t.string :nombre
      t.text :descripcion
      t.integer :ancho
      t.integer :alto
      t.integer :fondo

      t.timestamps null: false
    end
  end
end
