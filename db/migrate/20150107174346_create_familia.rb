class CreateFamilia < ActiveRecord::Migration
  def change
    create_table :familia do |t|
      t.string :nombre
      t.text :descripcion

      t.timestamps null: false
    end
  end
end
