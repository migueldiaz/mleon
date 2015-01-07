class CreateMuebles < ActiveRecord::Migration
  def change
    create_table :muebles do |t|
      t.string :nombre
      t.text :descripcion
      t.integer :ancho
      t.integer :alto
      t.integer :fondo
      t.string :familia

      t.timestamps null: false
    end
  end
end
