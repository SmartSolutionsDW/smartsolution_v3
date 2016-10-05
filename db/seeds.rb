# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Producto.delete_all

TipoProducto.delete_all


# Categories

TipoProducto.create(name: 'Bebidas sin alcohol')
TipoProducto.create(name: 'Licores')
TipoProducto.create(name: 'Vinos')
TipoProducto.create(name: 'Cervezas')
TipoProducto.create(name: 'Piqueos')

