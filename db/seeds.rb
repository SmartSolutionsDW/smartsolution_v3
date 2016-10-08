# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


TipoProducto.delete_all
Employee.delete_all

# Tipo de Producto

TipoProducto.create(name: 'Bebidas sin alcohol', estado:'1')
TipoProducto.create(name: 'Licores', estado:'1') 
TipoProducto.create(name: 'Vinos', estado:'1')
TipoProducto.create(name: 'Cervezas', estado:'1')
TipoProducto.create(name: 'Piqueos', estado:'1')


# Empleados

Employee.create(nombre:'Manfred', apellido:'Chaupin Mejia', dni:'45025759', correo:'manfredp88@gmail.com', password:'123456789', admin:'1')
Employee.create(nombre:'Mario', apellido:'Castro Ascencio', dni:'71729170', correo:'mcastroascencio@gmail.com', password:'123456789', admin:'1')
Employee.create(nombre:'Jhonatan', apellido:'Loayza Ortiz', dni:'45781945', correo:'jhonataloayza@gmail.com', password:'123456789', admin:'1')

