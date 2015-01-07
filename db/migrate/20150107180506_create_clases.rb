class CreateClases < ActiveRecord::Migration
  def change
    create_table :clases do |t|
      t.string :nombre
      t.text :descripcion

      t.timestamps null: false
    end
  end
end
