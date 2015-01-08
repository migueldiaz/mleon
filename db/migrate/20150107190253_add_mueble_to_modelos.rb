class AddMuebleToModelos < ActiveRecord::Migration
  def change
    add_reference :modelos, :mueble, index: true
    add_foreign_key :modelos, :muebles
  end
end
