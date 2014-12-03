# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Event.create(name: "iDOLM@STER vs Love Live", location: "Tokyo", date: "2015/04/20")
Item.create([
  {name: "Onigiri", description: "This feeds the Miki", price: "100", eventid: 1},
  {name: "Flat Bread", description: "This feeds the Chihaya", price: "100", eventid: 1}
])