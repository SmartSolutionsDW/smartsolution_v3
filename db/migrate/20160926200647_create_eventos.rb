class CreateEventos < ActiveRecord::Migration
  def change
    create_table :eventos do |t|
      t.integer :co_evento
      t.integer :co_local
      t.date :fe_evento
      t.integer :qt_capacidad
      t.text :descripcion

      t.timestamps null: false
    end
  end
end
