class CreateProductos < ActiveRecord::Migration
  def change
    create_table :productos do |t|
      t.string :Co_Producto
      t.string :No_Producto
      t.decimal :Ss_Precio
      t.integer :Ct_Stock
      t.references :tipo_producto, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
