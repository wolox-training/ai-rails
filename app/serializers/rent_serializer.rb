class RentSerializer < ActiveModel::Serializer
  attributes :id, :from, :to, :book, :user
end
