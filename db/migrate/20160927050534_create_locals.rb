class CreateLocals < ActiveRecord::Migration
  def change
    create_table :locals do |t|
      t.string :No_Local
      t.string :No_Direccion
      t.string :Nu_Telefono
      t.string :Tx_Correo

      t.timestamps null: false
    end
  end
end
