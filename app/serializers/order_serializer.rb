class OrderSerializer < ActiveModel::Serializer
  attributes :id, :status, :note_from_buyer, :note_from_seller, :user, :address, :requests
end
