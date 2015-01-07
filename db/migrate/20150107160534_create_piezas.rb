class CreatePiezas < ActiveRecord::Migration
  def change
    create_table :piezas do |t|
      t.string :nombre
      t.string :tipo
      t.text :descripcion
      t.integer :ancho
      t.integer :alto

      t.timestamps null: false
    end
  end
end
