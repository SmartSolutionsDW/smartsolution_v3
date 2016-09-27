class CreateReservas < ActiveRecord::Migration
  def change
    create_table :reservas do |t|
      t.integer :co_reserva
      t.integer :co_sala
      t.string :no_dni
      t.date :fe_reserva
      t.text :tx_Description

      t.timestamps null: false
    end
  end
end
