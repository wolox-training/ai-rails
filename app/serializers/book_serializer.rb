class BookSerializer < ActiveModel::Serializer
  attributes :author, :genre, :title, :description
end
