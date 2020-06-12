# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

items = Item.create([
  {name: 'scallops', description: 'Scallop is a common name that is primarily applied to any one of numerous species of saltwater clams or marine bivalve mollusks in the taxonomic family Pectinidae, the scallops'},
  {name: 'john dory', description: "John Dory, St Pierre or Peter's Fish, refers to fish of the genus Zeus, especially Zeus faber, of widespread distribution."},
  {name: 'dover sole', description: "The common sole, Dover sole, or black sole is a species of flatfish in the family Soleidae. It lives on the sandy or muddy seabed of the northern Atlantic and the Mediterranean Sea where it often semi-immerses itself in the substrate."}  
])

users = User.create([
  {email: 'harr.hughes@gmail.com', full_name: 'Harrison Hughes (work)', password: '000001', password_confirmation: '000001', is_admin: true}, # eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoyfQ.rXOh2dSBtTDo41suF8Z8t5Q3vudwnCUBGjVTO_tpAxA
  {email: 'hh378@exeter.ac.uk', full_name: 'Harrison Hughes (student)', password: '000002', password_confirmation: '000002', is_admin: false}
])

address1 = Address.create({line_one: "6 Mayflower Close", line_two: "", town_city: "Lymington", county: "Hampshire", postcode: "SO41 3SN", contact_number: "01590670311", extra_info: "", user: users[0]})
address2 = Address.create({line_one: "7 Mayflower Close", line_two: "", town_city: "Lymington", county: "Hampshire", postcode: "SO41 3SN", contact_number: "07794341674", extra_info: "", user: users[1]})
# address1.update(user: users[0])
# address2.update(user: users[1])