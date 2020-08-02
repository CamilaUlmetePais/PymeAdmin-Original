# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).

Supply.create({name: "Queso", price: 80, unit: "kg", stock: 100})
Supply.create({name: "Huevos", price: 25, unit: "u", stock: 100})
Supply.create({name: "Marineras", price: 50, unit: "u", stock: 100})
Supply.create({name: "Servicios", price: 1, unit: "$", stock: 100})
Supply.create({name: "Impuestos", price: 1, unit: "$", stock: 100})
Supply.create({name: "Salarios", price: 1, unit: "$", stock: 100})
Supply.create({name: "Pollo", price: 100, unit: "u", stock: 100})
Supply.create({name: "Pan rallado", price: 300, unit: "kg", stock: 100})
Supplier.create({name: "Juan", phone_number: "11 12345678", account_balance: 0})
Supplier.create({name: "Norma", phone_number: "11 12345678", account_balance: 0})
Supplier.create({name: "Santiago", phone_number: "11 12345678", account_balance: 0})
Supplier.create({name: "Edén", phone_number: "11 12345678", account_balance: 0})
Supplier.create({name: "AySA", phone_number: "11 12345678", account_balance: 0})
Supplier.create({name: "Monotributo", phone_number: "11 12345678", account_balance: 0})
Supplier.create({name: "ABL", phone_number: "11 12345678", account_balance: 0})
Supplier.create({name: "Alquiler", phone_number: "11 12345678", account_balance: 0})
Product.create({name: "Queso", price: 80, unit: "kg", stock: 100})
Product.create({name: "Huevos", price: 25, unit: "u", stock: 100})
Product.create({name: "Marineras", price: 50, unit: "u", stock: 100})
Product.create({name: "Milanesas", price: 150, unit: "kg", stock: 100})
Product.create({name: "Alitas", price: 80, unit: "kg", stock: 100})
Product.create({name: "Pechuga", price: 180, unit: "kg", stock: 100})
Product.create({name: "Pata y muslo", price: 150, unit: "kg", stock: 100})
SupplyProductLink.create ({product_id: 1, supply_id: 1})
SupplyProductLink.create ({product_id: 2, supply_id: 2})
SupplyProductLink.create ({product_id: 3, supply_id: 3})
inflow_item1 = {quantity: 10, product_id: 7, inflow_id: 1 }   # subtotal = 10*150=1500
inflow_item2 = {quantity: 5, product_id: 4, inflow_id: 1 }    # subtotal = 5*150=750
inflow_item3 = {quantity: 2.35, product_id: 5, inflow_id: 2 } # subtotal = 2.35*80=188
inflow_item4 = {quantity: 3, product_id: 6, inflow_id: 3 }    # subtotal = 3*180=540
inflow_item5 = {quantity: 2.5, product_id: 4, inflow_id: 3 }  # subtotal = 2.5*150=375
inflow_item6 = {quantity: 5, product_id: 6, inflow_id: 4 }    # subtotal = 5*180=900
Inflow.create({total: 2250, cash: true, inflow_items_attributes: [inflow_item1, inflow_item2] })
Inflow.create({total: 188, cash: false, inflow_items_attributes: [inflow_item3] })
Inflow.create({total: 915, cash: true, inflow_items_attributes: [inflow_item4, inflow_item5] })
Inflow.create({total: 900, cash: true, inflow_items_attributes: [inflow_item6] })
outflow_item1 = {quantity: 500, supply_id: 4, outflow_id: 1 } # subtotal = 500*1=500
outflow_item2 = {quantity: 20, supply_id: 7, outflow_id: 2 }  # subtotal = 20*100=2000
outflow_item3 = {quantity: 2, supply_id: 8, outflow_id: 2 }   # subtotal = 2*300=600
Outflow.create({total: 500, paid: 500, cash: true, supplier_id: 4, outflow_items_attributes: [outflow_item1]})
Outflow.create({total: 2600, paid: 2600, cash: true , supplier_id: 1, outflow_items_attributes: [outflow_item2, outflow_item3]})
User.create({username: "Administrador", password: "123456", password_confirmation: "123456", admin: true })
User.create({username: "Caja", password: "123456", password_confirmation: "123456"})