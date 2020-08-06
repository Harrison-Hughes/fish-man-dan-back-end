# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# {name: '', size: '', fresh: '', is_frozen: , price_by_each: , custom_amount: , price_per: '', min: "", max: "",  grade: '' }

items = Item.create([
  {name: 'Shetland Cod portions', size: '140g - 170g', fresh: 'fresh', is_frozen: false, price_by_each: true, price_per: '3.50', min: "1", max: "100",  grade: 'Superior' },
  {name: 'Shetland Cod whole side', size: '1.2kg - 1.5kg', fresh: 'fresh', is_frozen: false, price_by_each: false, price_per: '15.95', min: "1", max: "100",  grade: 'Superior' },
  {name: 'Shetland Salmon', size: '140g - 170g', fresh: 'fresh', is_frozen: false, price_by_each: true, price_per: '3.00', min: "1", max: "100",  grade: 'Superior' },
  {name: 'Cod, bacon and brie fishcakes', size: '115g', fresh: '', is_frozen: true, price_by_each: true , price_per: '1.50', min: "1", max: "100",  grade: '' },
  {name: 'Farmed bass', size: '400g - 600g', fresh: 'fresh', is_frozen: false, price_by_each: true, price_per: '5.00', min: "1", max: "100",  grade: 'Farmed in greece' },
  {name: 'Brixham monkfish fillet skinless and boneless', size: 'Cut to any', fresh: 'fresh', is_frozen: false, price_by_each: false, custom_amount: true, price_per: '19.95', min: "1", max: "100",  grade: 'superior' },
  {name: 'Sashimi grade yellow fin tuna', size: 'Cut to any', fresh: 'fresh', is_frozen: false, price_by_each: false, custom_amount: true, price_per: '22.5', min: "", max: "",  grade: 'superior' }
])

users = User.create([
  {email: 'harr.hughes@gmail.com', full_name: 'Harrison Hughes (work)', password: '000001', password_confirmation: '000001', is_admin: true}, # eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxfQ.M_Ia2AyNN2k8WCcuWMCIOBIZ0m-lyHoYMhQgw7o3faU
  {email: 'hh378@exeter.ac.uk', full_name: 'Harrison Hughes (student)', password: '000002', password_confirmation: '000002', is_admin: false} # eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoyfQ.rXOh2dSBtTDo41suF8Z8t5Q3vudwnCUBGjVTO_tpAxA
])

addresses = Address.create([
  {recipient_name: "HHA", line_one: "6 Mayflower Close", line_two: "", town_city: "Lymington", county: "Hampshire", postcode: "SO41 3SN", contact_number: "01590670311", user: users[0]}, 
  {recipient_name: "Harr", line_one: "7 Mayflower Close", line_two: "", town_city: "Lymington", county: "Hampshire", postcode: "SO41 3SN", contact_number: "07794341674", user: users[1]}
])
# address = Address.create({recipient_name: "", line_one: "7 Mayflower Close", line_two: "", town_city: "Lymington", county: "Hampshire", postcode: "SO41 3SN", contact_number: "07794341674", user: users[1]})

