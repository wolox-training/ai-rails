class Book < ApplicationRecord
  validates :author, :genre, :image, :title, :publisher, :year, presence: true
end
