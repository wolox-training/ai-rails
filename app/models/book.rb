class Book < ApplicationRecord
  validates :author, presence: true
  validates :genre, presence: true
  validates :image, presence: true
  validates :title, presence: true
  validates :publisher, presence: true
  validates :year, presence: true
end
