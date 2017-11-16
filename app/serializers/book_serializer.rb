class BookSerializer < ActiveModel::Serializer
  attributes :author, :genre, :title
end
