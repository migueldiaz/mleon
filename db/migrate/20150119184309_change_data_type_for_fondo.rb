class ChangeDataTypeForFondo < ActiveRecord::Migration
  def change
  	 change_table :muebles do |t|
      t.change :ancho, :float
      t.change :alto, :float
      t.change :fondo, :float
    end
  end
end
