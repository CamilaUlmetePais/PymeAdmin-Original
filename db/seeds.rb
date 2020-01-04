# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Supply.create({name: "Servicios", price: 1, unit: "$", stock: 0})
Supply.create({name: "Impuestos", price: 1, unit: "$", stock: 0})
Supply.create({name: "Salarios", price: 1, unit: "$", stock: 0})
Supply.create({name: "Queso", price: 80, unit: "kg", stock: 0})
Supply.create({name: "Pollo", price: 100, unit: "kg", stock: 0})
Supply.create({name: "Huevos", price: 25, unit: "u", stock: 0})
Supply.create({name: "Marineras", price: 50, unit: "u", stock: 0})
Supplier.create({name: "Pablo", phone_number: "11 12345678", account_balance: 0})
Supplier.create({name: "Norma", phone_number: "11 12345678", account_balance: 0})
Supplier.create({name: "Santiago", phone_number: "11 12345678", account_balance: 0})
Supplier.create({name: "Edén", phone_number: "11 12345678", account_balance: 0})
Supplier.create({name: "AySA", phone_number: "11 12345678", account_balance: 0})
Supplier.create({name: "Monotributo", phone_number: "11 12345678", account_balance: 0})
Supplier.create({name: "ABL", phone_number: "11 12345678", account_balance: 0})
Supplier.create({name: "Alquiler", phone_number: "11 12345678", account_balance: 0})
Product.create({name: "Milanesas", price: 150, unit: "kg", stock: 100})
Product.create({name: "Alitas", price: 80, unit: "kg", stock: 100})
Product.create({name: "Pechuga", price: 180, unit: "kg", stock: 100})
Product.create({name: "Pata y muslo", price: 150, unit: "kg", stock: 100})
