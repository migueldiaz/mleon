class CreateClientes < ActiveRecord::Migration
  def change
    create_table :clientes do |t|
      t.string :nombre
      t.string :CIF
      t.string :telefono
      t.string :email
      t.text :direccion
      t.text :notas

      t.timestamps null: false
    end
  end
end
