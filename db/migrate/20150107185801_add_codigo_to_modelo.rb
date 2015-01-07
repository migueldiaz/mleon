class AddCodigoToModelo < ActiveRecord::Migration
  def change
    add_column :modelos, :codigo, :string
  end
end
