# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.destroy_all

puts "Starting user load!"
u1 = User.create name: 'Luke',email: 'luke@ga.co',password:'chicken',image:  'https://fillmurray.com/200/300'
u2 = User.create name: 'Linna',email: 'linna@ga.co',password:'chicken',image: 'https://fillmurray.com/200/300'
u3 = User.create name: 'John',email: 'john@ga.co',password:'chicken',image: 'https://fillmurray.com/200/300'

puts "Created #{User.all.length} users."


Category.destroy_all
puts "Starting category load!"
c1 = Category.create name: 'Pet'
c2 = Category.create name: 'Household'
c3 = Category.create name: 'Auto'
c4 = Category.create name: 'Food'
c5 = Category.create name: 'Eating Out'
c6 = Category.create name: 'Finance'
c7 = Category.create name: 'Shopping'
c8 = Category.create name: 'Science'
c9 = Category.create name: 'Travel'
c10 = Category.create name: 'Electronics'
c11 = Category.create name: 'Education'
c12 = Category.create name: 'Fashion'
c13 = Category.create name: 'Music'

puts "Created #{Category.all.length} categories."

Post.destroy_all
puts "Starting post load!"
p1 = Post.create title: 'Remove dog hair from laundry',content: 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', category: c1, user: u3
p2 = Post.create title: 'Storing bananas',content: 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt.  Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', category: c4, user: u3
p3 = Post.create title: 'Getting cheap music',content: 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.', category: c13, user: u3

puts "Created #{Post.all.length} posts."
