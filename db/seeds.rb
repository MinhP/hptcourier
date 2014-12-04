# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Event.create(name: "iDOLM@STER vs Love Live", location: "Tokyo", date: "2015/04/20")
Item.create([
  {name: "Onigiri", description: "This feeds the Miki", price: "100", event_id: 1},
  {name: "Flat Bread", description: "This feeds the Chihaya", price: "100", event_id: 1}
])
Order.create(user_id: 1, event_id: 1)
Orderitem.create(order_id: 1, item_id: 1, quantity: 765)
Orderitem.create(order_id: 1, item_id: 2, quantity: 72)
User.create(name: "MinhP", email: "lol@dot.com", instructions: "bitcoins pls")