class Book < ApplicationRecord
  validates :author, :genre, :image, :title, :publisher, :year, :description, presence: true

  scope :title, ->(title) { where('title ilike?', "%#{title}%") }
  scope :author, ->(author) { where('lower(author) like?', "%#{author.downcase}%") }
  scope :description, lambda { |description|
    where('lower(description) like?', "%#{description.downcase}%")
  }
  scope :genre, ->(genre) { where genre: genre }
end
