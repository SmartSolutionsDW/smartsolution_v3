class CreateSalas < ActiveRecord::Migration
  def change
    create_table :salas do |t|
      t.integer :co_sala
      t.integer :co_local
      t.integer :no_sala
      t.integer :qt_capacidad
      t.text :description

      t.timestamps null: false
    end
  end
end
