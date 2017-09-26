class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :competitors
end
