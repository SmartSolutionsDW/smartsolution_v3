class CreateProductos < ActiveRecord::Migration
  def change
    create_table :productos do |t|
      t.references :tipo_producto, index: true, foreign_key: true
      t.string :name, limit: 80
      t.decimal :price, precision: 8, scale: 2
      t.string :estado, limit: 1

      t.timestamps null: false
    end
  end
end
