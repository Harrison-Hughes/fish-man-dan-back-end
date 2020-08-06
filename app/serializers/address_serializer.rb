class AddressSerializer < ActiveModel::Serializer
  attributes :id, :recipient_name, :line_one, :line_two, :town_city, :county, :postcode, :contact_number
end
