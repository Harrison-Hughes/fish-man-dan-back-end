# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

items = Item.create([
  {amount: '500g', name: 'scallops1', description: 'Scallop is a common name that is primarily applied to any one of numerous species of saltwater clams or marine bivalve mollusks in the taxonomic family Pectinidae, the scallops'},
  {amount: '500g', name: 'scallops2', description: 'Scallop is a common name that is primarily applied to any one of numerous species of saltwater clams or marine bivalve mollusks in the taxonomic family Pectinidae, the scallops'},
  {amount: '400g', name: 'scallops3', description: 'Scallop is a common name that is primarily applied to any one of numerous species of saltwater clams or marine bivalve mollusks in the taxonomic family Pectinidae, the scallops'}
  ])

users = User.create([
  {email: 'hh378@exeter.ac.uk', full_name: 'Harrison Hughes (student)', password: '0000', password_confirmation: '0000'},
  {email: 'harr.hughes@gmail.com', full_name: 'Harrison Hughes (work)', password: '0001', password_confirmation: '0001'}
])