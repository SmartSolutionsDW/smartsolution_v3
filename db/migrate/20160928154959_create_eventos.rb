class CreateEventos < ActiveRecord::Migration
  def change
    create_table :eventos do |t|
      t.references :local, index: true, foreign_key: true
      t.datetime :fe_evento
      t.integer :capacidad
      t.string :descripcion

      t.timestamps null: false
    end
  end
end
