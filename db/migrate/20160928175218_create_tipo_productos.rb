class CreateTipoProductos < ActiveRecord::Migration
  def change
    create_table :tipo_productos do |t|
      t.string :name, limit: 50
      t.string :estado, limit: 1

      t.timestamps null: false
    end
  end
end
