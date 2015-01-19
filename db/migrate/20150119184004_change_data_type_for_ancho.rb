class ChangeDataTypeForAncho < ActiveRecord::Migration
  def change
  	 change_table :piezas do |t|
      t.change :ancho, :float
      t.change :alto, :float
    end
  end
end
