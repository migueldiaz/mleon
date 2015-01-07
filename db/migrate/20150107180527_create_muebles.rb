class CreateMuebles < ActiveRecord::Migration
  def change
    create_table :muebles do |t|
      t.string :nombre
      t.text :descripcion
      t.integer :ancho
      t.integer :alto
      t.integer :fondo
      t.references :clase, index: true

      t.timestamps null: false
    end
    add_foreign_key :muebles, :clases
  end
end
