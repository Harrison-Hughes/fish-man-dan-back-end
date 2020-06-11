class UserSerializer < ActiveModel::Serializer
  attributes :id, :email, :full_name, :token, :is_admin, :addresses
end
