class AddressSerializer < ActiveModel::Serializer
  attributes :id, :line_one, :line_two, :town_city, :county, :postcode, :contact_number, :extra_info
end
