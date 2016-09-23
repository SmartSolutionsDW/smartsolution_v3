class CreateEmployees < ActiveRecord::Migration
  def change
    create_table :employees do |t|
      t.string :nombre
      t.string :apellido
      t.string :dni
      t.string :correo
      t.string :password
      t.boolean :admin

      t.timestamps null: false
    end
    add_index :employees, :dni, unique: true
  end
end
