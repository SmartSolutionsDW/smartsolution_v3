class CreateInventarios < ActiveRecord::Migration
  def change
    create_table :inventarios do |t|
      t.references :local, index: true, foreign_key: true
      t.references :producto, index: true, foreign_key: true
      t.integer :cant
      t.decimal :precio_compra, precision: 8, scale: 2
      t.decimal :precio_venta, precision: 8, scale: 2
      t.string :entrada_salida, limit: 1

      t.timestamps null: false
    end
  end
end
