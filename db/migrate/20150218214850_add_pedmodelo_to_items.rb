class AddPedmodeloToItems < ActiveRecord::Migration
  def change
    add_reference :items, :pedmodelo, index: true
    add_foreign_key :items, :pedmodelos
  end
end
