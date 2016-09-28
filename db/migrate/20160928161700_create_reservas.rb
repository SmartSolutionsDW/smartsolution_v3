class CreateReservas < ActiveRecord::Migration
  def change
    create_table :reservas do |t|
      t.references :sala, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true
      t.datetime :fe_reserva
      t.string :descripcion
      t.string :estado, limit: 1
      t.boolean :aprobado

      t.timestamps null: false
    end
  end
end
