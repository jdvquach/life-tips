# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.destroy_all

puts "Starting user load!"
u1 = User.create name: 'Luke',email: 'luke@ga.co',password:'chicken'
u2 = User.create name: 'Linna',email: 'linna@ga.co',password:'chicken'
u3 = User.create name: 'John',email: 'john@ga.co',password:'chicken'

puts "Created #{User.all.length} users."
