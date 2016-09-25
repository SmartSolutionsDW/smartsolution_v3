class CreateTipoProductos < ActiveRecord::Migration
  def change
    create_table :tipo_productos do |t|
      t.string :Co_TipoProducto
      t.string :No_CoTipoProducto

      t.timestamps null: false
    end
  end
end
