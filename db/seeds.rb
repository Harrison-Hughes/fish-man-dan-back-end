# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

items = Item.create([
  {amount: '500g', name: 'scallops', description: 'tasty goodness'},
  {amount: '500g', name: 'scallops', description: 'tasty goodness'},
  {amount: '400g', name: 'scallops', description: 'tasty goodness'}
  ])

users = User.create([
  {email: 'hh378@exeter.ac.uk', full_name: 'Harrison Hughes (student)', password_digest: '0000'},
  {email: 'harr.hughes@gmail.com', full_name: 'Harrison Hughes (work)', password_digest: '0001'}
])

