class CreateSalas < ActiveRecord::Migration
  def change
    create_table :salas do |t|
      t.references :local, index: true, foreign_key: true
      t.integer :no_sala
      t.integer :qt_capacidad
      t.string :descripcion

      t.timestamps null: false
    end
  end
end
