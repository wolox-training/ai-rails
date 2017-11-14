FactoryBot.define do
  factory :book do
    author  Faker::Book.author
    title   Faker::Book.title
    year    "1990"
    publisher Faker::Book.publisher
    genre   Faker::Book.genre
    image   "image.jpg"
  end
end
